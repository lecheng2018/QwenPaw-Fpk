# QwenPaw FPK v1.1.12 审计报告

**审计日期：** 2026-06-18  
**审计版本：** 1.1.12 (commit b69f910)  
**参考基准：** hermes fpk v0.16.7 + fnOS 官方文档 (fnnas/fnnas-docs)

---

## 审计结论

共发现 **2 个 Bug + 7 个规范性问题**。2 个 Bug 均影响核心功能，建议发版前修复。

### 与原项目（naspk-com/QwenPaw v1.1.11）对比

yaozy fork 的 `install_callback`、`upgrade_callback`、`uninstall_callback`、`main`、`api.cgi` 与原项目**完全一致**（diff 零差异）。yaozy 只改了 `config_callback`（重写）和 `manifest`。

| 问题 | 原项目 v1.1.11 | yaozy v1.1.12 | 来源 |
|:-----|:--------------:|:--------------:|:-----|
| B1: QWENPAAW typo | ❌ 不存在（不设 LOG_LEVEL） | ✅ 存在 | **yaozy 引入** |
| B2: handle_error 未定义 | ✅ 存在 | ✅ 存在 | 原项目已有 |
| S1: set -e 缺失 | ✅ 全缺 | ⚠️ 部分缺 | 原项目已有，yaozy 修了 config |
| S2: build/ 提交到 git | ❌ 不存在 | ✅ 存在 | **yaozy 引入** |
| S3: upgrade 权限不完整 | ✅ 存在 | ✅ 存在 | 原项目已有 |
| S4: shellcheck 警告 | ✅ 存在 | ✅ 存在 | 原项目已有 |
| S5: www/ 无关资源 | ✅ 存在 | ✅ 存在 | 原项目已有 |
| S6: api.cgi 缺 LOG_LEVEL | ✅ 存在 | ✅ 存在 | 原项目已有 |
| S7: install_init 缺换行 | ✅ 存在 | ✅ 存在 | 原项目已有 |

**结论：原项目本身存在 7 个问题，yaozy 引入 2 个新问题。不能盲目照搬原项目做法。**

---

## 🔴 Bug（必须修复）

### B1. `config_callback:45` — `QWENPAAW_LOG_LEVEL` 拼写错误（回归 Bug）

| 项目 | 内容 |
|:-----|:-----|
| **文件** | `cmd/config_callback` 第 45 行 |
| **现状** | `export QWENPAAW_LOG_LEVEL="${LOG_LEVEL}"`（多了一个 A） |
| **正确** | `export QWENPAW_LOG_LEVEL="${LOG_LEVEL}"` |
| **对比** | `cmd/main:13` 是正确的 `QWENPAW_LOG_LEVEL` |
| **原项目** | 原项目 config_callback 不设置 LOG_LEVEL 环境变量（只 kill PID + exit 0，依赖 fnOS 自动重启），所以无此 typo |
| **根因** | commit `7a6df74` 修过 `main` 的同名 typo，但 commit `facfb65`（v1.1.12）重写 `config_callback` 时又把 typo 带回来了 |
| **影响** | 用户在 fnOS 控制台修改日志级别后，config_callback 重启服务时设置了错误的环境变量名，日志级别配置不生效 |

### B2. `install_callback` / `upgrade_callback` — `handle_error` 函数未定义

| 项目 | 内容 |
|:-----|:-----|
| **文件** | `cmd/install_callback` 第 68 行、`cmd/upgrade_callback` 第 66 行 |
| **现状** | pip 安装失败时调用 `handle_error`，但该函数从未定义 |
| **原项目** | **原项目也有此 bug**。`handle_error` 定义在 `config_callback` 中，但 bash 函数不跨脚本共享——每个 cmd/ 脚本独立执行，install/upgrade 看不到 config_callback 里的函数 |
| **影响** | pip 安装失败时：`handle_error` 返回 127（command not found）→ 脚本无 `set -e` 不中止 → 继续执行 → 最终 `exit 0` → **安装/升级失败但报成功** |
| **修复** | 将 `handle_error` 替换为 `exit 1`，或定义错误处理函数 |

---

## 🟡 规范性问题（建议修复）

### S1. `install_callback` / `upgrade_callback` 缺少 `set -e`

- `config_callback` 有 `set -e`，hermes 的 `upgrade_callback` 也有 `set -e`
- install/upgrade 缺失导致中间步骤（venv 创建、pip 升级）失败时不中止

### S2. `build/` 构建产物提交到 git

- 包含 `app.tgz`（12MB）、过时的 `manifest`、`cmd/` `wizard/` `config/` 副本
- `build/manifest` 的 `desktop_applaunchname` 还是旧的 `com.dustinky.qwenpaw`（根 manifest 已改为 `com.dustinky.qwenpaw.Application`）
- `.gitignore` 未排除 `build/`
- **修复：** `.gitignore` 添加 `build/`，`git rm -r --cached build/`

### S3. `upgrade_callback` 结尾权限修复不完整

- 缺少 `chmod -R 755 "${TRIM_PKGVAR}"` 和 `chmod -R 755 "${TRIM_PKGETC}"`
- `install_callback` 有完整的 chown+chmod 三件套（WORKING_DIR + PKGVAR + PKGETC）

### S4. shellcheck 警告

| 脚本 | 警告 | 说明 |
|:-----|:-----|:-----|
| install/upgrade | SC2086 | `$PIP_OPTS` 未加引号（应 `"$PIP_OPTS"`） |
| install/upgrade | SC2164 | `cd "${CODE_DIR}"` 缺 `\|\| exit` |
| install/upgrade | SC2034 | `ERROR_MSG` 赋值后未使用（与 B2 相关） |
| main | SC2086 | `${LOG_FILE}`、`${pid}` 等未加引号 |

### S5. `app/www/` 混入 ui-fndesign 无关静态资源

- `bilibili.jpg`、`donate-dark.png`、`donate-light.png`、`douyin.jpg`、`wechat-qrcode.png`
- `favicon.png`（232KB）md5 与 `ui-fndesign/public/favicon.png` 完全一致 — 是 Nuxt 模板的 favicon，不是 QwenPaw 的
- **修复：** 清理 `app/www/` 中的无关图片，替换为 QwenPaw 自己的 favicon

### S6. `api.cgi` 启动命令缺少 `QWENPAW_LOG_LEVEL`

- `start_service()` / `restart_service()` / `upgrade_service()` 的启动命令都没有设置 `QWENPAW_LOG_LEVEL`
- `main` 和 `config_callback` 都设置了（除 B1 的 typo）
- 影响：通过控制台 API 启动/重启的服务不应用日志级别配置

### S7. `install_init` 缺少末尾换行符 + 注释不一致

- `install_init` 的 `exit 0` 后无换行符（POSIX 规范要求文本文件以换行结尾）
- `install_init` 有英文注释，其他三个 init 脚本（config/uninstall/upgrade）没有注释

---

## ✅ 确认正常的部分

| 检查项 | 结果 |
|:-------|:-----|
| manifest 字段完整性 | ✅ 符合官方规范 |
| `desktop_uidir = ui` → `app/ui/config` 入口配置 | ✅ 两个入口（主应用 iframe + 控制台 CGI）配置正确 |
| `app/ui/images/` 图标 | ✅ icon_64/256 + console_64/256 齐全 |
| `app/ui/index.cgi` + `app/ui/api.cgi` | ✅ CGI 脚本功能完整（状态/启停/升级/日志/备份/重置认证） |
| `wizard/install` + `wizard/upgrade` 的 `wizard_pypi_mirror` | ✅ 表单项与脚本变量对应 |
| 行尾（CRLF 检查） | ✅ 全部 LF |
| shebang | ✅ 全部 `#!/bin/bash` |
| 可执行权限 | ✅ cmd/ 全部 755 |
| bash 语法检查 | ✅ 全部通过 |
| `upgrade_callback` 不重启服务 | ✅ 非 Bug — 官方文档确认 fnOS 升级后自动重启应用 |
| `uninstall_callback` 逻辑 | ✅ 保留运行环境/配置选项正确 |
