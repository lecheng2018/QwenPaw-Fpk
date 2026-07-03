# Changelog

## v1.1.12.post2 (2026-07-04)

### 基础版本

- 同步上游 QwenPaw v1.1.12.post2 官方源码

### 合并上游 PR

| PR | 变更说明 |
|---|---|
| #5334 | 折叠侧边栏模式下支持切换 Agent；ChatActionGroup 兼容性修复 |
| #5363 | Settings/Agents 页面移动端响应式布局优化 |
| #5394 | Plugin Manager 移动端目录 UI 清理与合并冲突解决 |
| #5447 | Console 通道遇到模型/运行时错误时 yield 失败 AgentResponse，避免 UI 卡死 |
| #5462 | 添加全局响应式工具类 |
| #5399 | Provider 设置页支持拖拽排序模型；provider.py 自动格式化 |
| #5597 | LLM 模型 fallback 后端：支持全局和 per-agent 路由端点，含测试文档 |
| #5598 | LLM fallback 前端配置 UI：全局回退配置页面、模型选项去重、重载提示 |

### Fpk 特有修改

- 安全加固：shell 命令自 kill 防护、chromadb 运行时探针、keyring 账号隔离
- 桌面端：子进程保护、端口持久化、Python 运行时重定向
- Token 使用量：每轮次使用量元数据、SSE 待处理状态、LRU 会话跟踪
- Cloudflare Quick Tunnel 支持（cloudflared 自动下载 + 驱动）
- 文件操作安全：JSON 损坏恢复、agent chat 请求携带 user_id
- Mission Runner：prd.json/loop_config.json 损坏检测与用户提示
- Proactive Agent：修复配置缓存污染（不修改 load_agent_config 返回对象）
- Memory Agent：Embedding 配置日志格式修复

### 构建信息

- Console 前端：React + Vite，构建产物 ~8.3MB（gzip ~2.4MB）
- UI 前端：Vue 3 + Vite + Bun，构建产物 ~670KB（gzip ~180KB）
- FPK 包大小：~15MB

---

## v1.1.12 (2026-06-22)

### 基础版本

- 同步上游 QwenPaw v1.1.12 官方源码

### 主要变更

- 修复控制台白屏（VITE_BASE_PATH 指向 fnOS cgi 路径）
- Hermes 风格工程化（build.sh 6 步流程 + scripts/sync-version.py + gen-audit.py + preflight.sh + GitHub Actions CI/CD + bun 工具链）
- staging 瘦身：fpk 从 ~190M 降至 15M，仅保留运行时必需文件
- 多通道支持（微信、QQ、钉钉、飞书、Discord、Telegram 等）
- 多智能体协作（独立配置、记忆和技能）
- 定时任务执行
- Skills 技能系统，能力可无限扩展
- 本地大模型支持（完全离线工作）
- 数据安全：全本地存储，多层安全防护
- 飞牛 fnOS 一键部署
