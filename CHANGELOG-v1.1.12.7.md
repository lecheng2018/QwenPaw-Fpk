# QwenPaw-Fpk 更新日志

**生成时间:** 2026-07-04  
**基础版本:** 上游 QwenPaw v1.1.12.post2  
**Fpk 版本:** 1.1.12.7 (Python: 1.1.12.post3)  
**FPK 产物:** build/com.dustinky.qwenpaw_v1.1.12.7.fpk (15MB)  
**SHA256:** 7195725d9a0c4ae5acb6aedad06aab81341f499a3891018e51db1c8c79d19b43

---

## 一、合并的上游 PR 列表

### 第一批（用户最初请求，8 个 PR）

| PR | 类别 | 说明 |
|---|---|---|
| #5334 | UI | 折叠侧边栏模式下切换 Agent；ChatActionGroup 兼容性修复 |
| #5363 | UI/移动 | Settings/Agents 页面移动端响应式布局优化 |
| #5394 | UI | Plugin Manager 移动端目录 UI 清理与合并冲突解决 |
| #5447 | 修复 | Console 通道遇到模型/运行时错误时 yield 失败 AgentResponse，避免 UI 卡死 |
| #5462 | UI/样式 | 添加全局响应式工具类 |
| #5399 | 功能/UI | Provider 设置页支持拖拽排序模型；provider.py 自动格式化 |
| #5597 | 功能 | LLM 模型 fallback 后端：支持全局和 per-agent 路由端点，含测试文档 |
| #5598 | 功能/UI | LLM fallback 前端配置 UI：全局回退配置页面、模型选项去重、重载提示 |

### 第二批（移动端适配，11 个 PR）

| PR | 类别 | 说明 |
|---|---|---|
| #5444 | UI/移动 | Header 移动端帮助菜单 + 侧边栏移动端优化 |
| #5445 | UI/移动 | ModelSelector 下拉框移动端溢出修复；长模型名 marquee 滚动 |
| #5446 | UI/移动 | Chat 移动端头部操作、session 抽屉和统一右侧 drawer |
| #5449 | UI/移动 | Debug 页面移动端适配 |
| #5451 | UI/移动 | Security 页面移动端适配 |
| #5458 | UI/移动 | Agent Skills 页面移动端适配 |
| #5459 | UI/移动 | Skill Market 页面移动端适配 |
| #5463 | UI/移动 | TokenUsage 表格移动端水平滚动 |
| #5464 | UI/移动 | Skill Pool 页面移动端适配 |
| #5470 | UI/移动 | Voice Transcription 设置页移动端适配 |
| #5744 | 修复 | 移动端聊天历史面板空 session 列表 |

### 第三批（Memory Reranker，2 个 PR）

| PR | 类别 | 说明 |
|---|---|---|
| #5647 | 功能/UI | Memory search reranker 前端配置面板 |
| #5648 | 功能 | Memory search reranker 后端：RerankerModelConfig + _rerank_search_results 集成 |

### 之前已包含的 PR（来自更早的 cherry-pick）

| PR | 类别 | 说明 |
|---|---|---|
| #5221 | 功能 | AgentScope middleware 注册 |
| #5285 | 修复 | 修复备份导入信任问题 |
| #5305 | 修复 | 改进本地 provider 模型就绪检查 |
| #5321 | 功能 | 滚动上下文管理器 — 持久历史 + recall REPL |
| #5409 | 测试 | 前端 M2 单元测试 (Stores + Hooks + Control pages) |
| #5422 | 测试 | chats 模块 W2 单元测试 (38 cases) |
| #5423 | 测试 | crons 模块 W1 单元测试 (51 cases) |
| #5428 | CI | 桌面端发布 E2E UI 验证 |
| #5434 | 测试 | 前端 M3-A 单元测试 |
| #5438 | 测试 | 前端 M3-B 单元测试 |
| #5450 | 功能/修复 | 重构 auto-memory 生命周期，增强 /compact 和添加 /system_prompt |
| #5454 | 修复 | macOS sandbox 缺少闭合括号 |
| #5457 | 性能 | 限制 send_file_to_user 文件大小 |
| #5460 | 修复 | WeCom QR code 获取失败（贪婪正则） |
| #5461 | 文档 | 更新 QwenPaw 2.0.0 路线图 |
| #5466 | 修复 | 修改 dingtalk 用 sender_id 前缀避免冲突 |
| #5467 | 修复 | upload_file 手动大小检查替换为工具函数 |
| #5469 | 性能 | 并行化 shutdown 减少关闭时间 |
| #5473 | 功能 | chat 面板扩展至 50%，编辑器区域缩小 |
| #5477 | 修复 | init 时移除 enable all |
| #5478 | 修复 | 回退 relative_path file preview |
| #5482 | 功能 | 增强 memory search 功能并简化元数据显示 |
| #5483 | 修复 | 允许编辑和删除已启用的 cron 任务 |
| #5485 | 修复 | 修复 mcp tool name pasre openai api |
| #5486 | 修复 | 修复 tool input json decode |
| #5487 | 修复 | 修复 streaming 路径和多段回复分割 |
| #5491 | 修复 | dashscope provider 遵循 extra_body generate_kwargs |
| #5493 | 功能 | 恢复 agentscope 2.0 下 chat token/context usage 环形指示器 |
| #5494 | 修复 | cron session 可见性、内存隔离和热重载稳定性 |
| #5495 | 功能 | 对齐 envelope event 翻译和 v1 streaming 协议 |
| #5500 | 功能 | /before_consume_process 移动 typing indicator |
| #5502 | 样式 | 移除 max-width 约束的 wide 模式样式 |
| #5504 | 功能 | 重设计 channel page 双 section 布局 |
| #5507 | 测试 | 稳定 flaky 集成测试 + 移除 dead /api/agent |
| #5509 | 功能 | 重设计 Tools page enabled/available split 布局 |
| #5511 | 修复 | 恢复 Langfuse trace grouping via 2.0 hook 和 middleware 集成 |
| #5513 | 功能 | 添加 DashScopeChatModel 到 ChatModelName 字面类型 |
| #5515 | 文档 | 更新 "tools" 翻译一致性 |
#5516 | 修复 | 修复 WeChat QR code 获取 |
| #5517 | 修复 | override format_tools for gemini |
| #5518 | 修复 | 修复桌面打包构建 |
| #5519 | 功能 | 添加 OpenAI Response API provider |
| #5521 | 功能 | Skills page 分为 enabled/disabled sections 双布局 |
| #5522 | 功能 | 添加 inbox source type filter |
| #5531 | 测试 | 并行ize 集成测试 + 加固 coverage pipeline |
| #5532 | 样式 | 恢复 SkillPool 样式 |
| #5534 | 样式 | readme 添加 trending badge |
| #5537 | 修复 | 只计算已配置 provider 为在线状态 |
| #5538 | 修复 | 修复 chat 保留 assistant markdown 换行 |
| #5540 | 功能 | 重构 auto memory system 使用 turn-based tracking |
| #5542 | 测试 | 适配 agentscope 2.0 E2E — 删除 Plan Mode |
| #5544 | UI/TokenUsage | page 调整 missing emptyState 和 emptyIcon 样式 |
| #5545 | 修复 | 修复 Gemini schema sanitizer 的 standalone type:null 为 type:object |
| #5549 | 修复 | 清理 nullable tool schemas |
| #5552 | 功能 | 注入 user_id 和 channel 到 ContextVarsSetupHook |
| #5553 | 修复 | 修复 observability — 恢复 Langfuse trace grouping |
| #5557 | 功能 | 配置执行超时时间 |
| #5559 | 性能 | 优化 ChatSession 切换性能 |
| #5565 | 功能 | qwenpaw-pet 插件修复 |
| #5570 | 修复 | 停止 plugin 安装风暴 |
| #5578 | 修复 | cii → init（语法修复） |
| #5582 | 修复 | 修复 recover streaming reasoning_content errors |
| #5592 | 样式 | 恢复 SkillPool 下载样式 |
| #5595 | 修复 | 隐藏 /console/inbox/events 访问日志 |
| #5596 | 功能 | 修复 chat 删除导致多余空行的 white-space pre-wrap |
| #5601 | 修复 | 修复 channel 推送 tool-guard 审批通知到 IM channel |
| #5604 | 功能 | 添加 config-aware enable/disable for tools |
| #5605 | 移除 | 删除 plan mode 配置 |
| #5608 | 版本 | bump 到 2.0.0b2（覆盖为 1.1.12.post3） |
| #5610 | 文档 | 更新 qwenpaw 2.0.0 文档 |
| #5613 | 修复 | 修复 deploy supervisord 崩溃重启 |
| #5614 | 文档 | 更新 context 管理文档 |
| #5617 | 修复 | 添加 per-channel no_text_debounce 配置 |
| #5618 | 样式 | 更新 figures & 删除 plan mode |
| #5619 | 样式 | 修复 console chat session 选中背景 & 清理未使用 CSS |
| #5621 | 文档 | 文档: Sandbox 章节 |
| #5623 | 修复 | 修复 governance OFF mode 仍然触发 tool approval |
| #5627 | CI | 集成: 放宽 Windows nightly HTTP 超时 + 添加挂起保护 |
| #5629 | 修复 | 修复 memory 相关 system prompt 以防止过度记忆写入 |
| #5632 | 修复 | 修复 toolCards — 计算行数前使用 stringifyResult |
| #5634 | 测试 | 测试 e2e: drop SLASH-006 plan command case |
| #5635 | 修复 | 修复 runtime agents: 将 Windows paths 转换为 file:// URLs |
| #5636 | 文档 | 重命名 HiClaw 为 AgentTeams |
| #5639 | 功能 | 技能自动同步 |
| #5640 | 修复 | 修复 runtime: 需要 coding_mode enabled 才能 project_dir |
| #5641 | 修复 | 修复 workspace: 允许桌面截图 |
| #5642 | 修复 | 强化 ACP 外部 runner 硬阻止策略 |
| #5643 | 性能 | 虚拟化 SidebarSessionList、去重轮询和可折叠日期分组 |
| #5644 | 文档 | 文档: TUI 页面 |
| #5645 | 修复 | 修复: 添加 coding mode project_dir as rw |
| #5646 | 特性 | feat: 更新 DashScope 内置模型列表 |
| #5647 | 样式 | style: 修复 reranker tooltip 的 prettier 格式化 |
| #5648 | 功能 | feat: memory 搜索 reranker 后端集成 |
| #5649 | 修复 | 修复 docker: 添加 init:true 防止僵尸进程 |
| #5650 | 修复 | 修复 market install queue clear |
| #5653 | 文档 | 文档: 添加 Architecture page (en + zh) |
| #5655 | 文档 | 文档: 更新 readme |
| #5656 | 修复 | 隔离 scrolling 到 simple mode |
| #5660 | 修复 | 恢复 spawn_subagent for Runtime 2.0 (#5523) |
| #5661 | 功能 | 添加 QwenPaw 版本兼容性过滤 |
| #5662 | CI | 修改 CI 中 channel name |
| #5664 | 功能 | 添加 non-owner tab info banner |
| #5666 | 文档 | 文档: 修复 channel 相关 feature 描述 |
| #5671 | 修复 | 修复 TUI 支持 CJK / IME input |
| #5678 | 文档 | 添加 Security 文档的 Access Policy 章节 |
| #5681 | CI | 提取 desktop verify 到 composite actions |
| #5682 | 修复 | 修复 governance strict mode 覆盖 ALLOW rules |
| #5683 | 性能 | 解决 session 切换闪烁和 queue alert 闪烁 |
| #5684 | 修复 | 禁用 models provider search input browser autocomplete |
| #5685 | 功能 | 添加 session-level tool approval |

---

## 二、构建修复（Fpk 特有修复）

| 文件 | 问题 | 修复方式 |
|---|---|---|
| `src/qwenpaw/providers/capping_formatter.py` | 模块缺失（PR #5597 依赖） | 从上游 PR #5457 提取并添加 |
| `src/qwenpaw/exceptions.py` | `RateLimitExceededException` 缺失 | 手动添加到异常类定义 |
| `console/src/layouts/Header.tsx` | Cherry-pick 合并冲突（重复变量声明） | 手动解决冲突，保留 Fpk 版本 |
| `console/src/api/root.ts` | 模块缺失 | 创建 API 请求基础模块存根 |
| `console/src/api/modules/plan.ts` | 模块缺失 | 创建 Plan API 模块存根 |
| `console/tsconfig.app.json` | strict 模式阻止 cherry-pick 代码编译 | 放宽 strict/noUnusedLocals/noUnusedParameters |

---

## 三、FPK 构建配置

| 配置项 | 值 |
|---|---|
| 打包工具 | fnpack v1.2.0 (Linux x86) |
| Node.js | v20.20.2 (via nvm) |
| 前端构建 | Bun + Vite 6 (ui-fndesign) + npm + Vite 6 (console) |
| 产物大小 | ~15MB (压缩后) |
| Python 版本 | 3.12 (fnOS 系统) |
| 构建命令 | `SKIP_FRONTEND=1 SKIP_CONSOLE=1 bash build.sh` |

---

## 四、已知限制

1. **Plan Mode 已移除** — 上游 v2.0.0 已删除 Plan Mode，相关前端代码仍保留但功能不可用
2. **TypeScript 检查放宽** — `tsconfig.app.json` 中 strict=false 以兼容 cherry-pick 代码
3. **console/src/api/root.ts** — 手动创建的简化版，可能需要根据实际需求补充完整功能
4. **ui-fndesign 未重新构建** — 使用 SKIP_FRONTEND=1 跳过，使用已有产物

---

## 五、Cherry-picked Commits（完整列表）

```
4ba99b953 fix(console): mobile chat history panel shows empty session list
283aa19ce feat(console): mobile adaptation for Skill Pool page
112ca77fe fix(Chat): mobile header actions, session dropdown, and unified right drawers
bb3a8da73 fix(Chat): prevent ModelSelector dropdown overflow on mobile; add marquee for long model names
f5f0db3de fix(layout): collapse sidebar on mobile first paint; hide auxiliary header items on narrow screens
c8bc58acd feat(console): add mobile help menu to Header
e88f4b5b3 fix: add capping_formatter and validation utilities
f8f6c3a16 feat(memory): add provider-agnostic reranker for memory search
a2654ce41 fix(tool-calls): cap tool responses before context insertion (#5510)
601510720 feat: filter plugin market and CDN catalog by QwenPaw version compatibility (#5661)
5f1ecc168 fix(acp): strengthen external runner hard-block policy (#5642)
84c58f4bc feat(console): add session-level tool approval (#5685)
c6182801e docs(security): add Access Policy section to security documentation (#5678)
1e179d604 fix(models): disable browser autocomplete for provider search input (#5684)
f716c4aef perf(console,chat): resolve session switch flash and queue alert flicker (#5683)
b58eae288 refactor(ci): extract desktop verify into composite actions (#5681)
48e63c30f fix(runtime): restore spawn_subagent for Runtime 2.0 (#5523) (#5660)
3537a542d fix(docker): add init:true to prevent zombie process accumulation (#5649)
9d7b8bd26 fix(tui): support CJK / IME input (bump textual to >=8.2.8) (#5671)
067d1d2e2 fix(docs): fix channel-related feature descriptions (#5666)
25c963664 feat(chat): add non-owner tab info banner above sender input (#5664)
0cdeac030 fix(ci): modify channel name in the pr template (#5662)
16ad83ba3 docs(readme): update and refine readme (#5655)
c49b247b0 fix(layouts): isolate sidebar session list scrolling to simple mode (#5656)
136efb1f6 feat(skill): Add skill auto sync (#5639)
935c8f37b feat(desktop): add Tauri tray behavior (#4041)
38b5c4848 fix(providers): recover streaming reasoning_content errors (#5582)
53fed13c5 feat(providers): update DashScope built-in model list (#5646)
006d1ce38 perf(sessionLists): virtualize SidebarSessionList, deduplicate polling and add collapsible date groups (#5643)
d4b8ecfc7 feat(plugins): add AgentScope middleware registration, structured versioned API (#5221)
6a24e4dce fix(skill):market install queue clear (#5650)
ca5bb39b8 docs(TUI): add Terminal UI (TUI) documentation page (#5644)
3ab58456b fix(governance): OFF mode still triggers tool approval (#5623)
a24766524 fix(memory): fix memory-related system prompt to avoid over-eager memory writing (#5629)
376a69b96 fix(workspace): allow desktop screenshot in workspace (#5641)
e14f32019 fix(heartbeat): make execution timeout configurable (#5557)
893d418fd fix(runtime): require coding_mode enabled before using project_dir (#5640)
5f92b0bf9 fix(runtime, agents): convert Windows paths to file:// URLs and fix reverse parsing (#5635)
b806b7018 test(console): PR#4 — frontend M3-B unit tests (Inbox + API modules) (#5438)
86a750c03 test(console): PR#3 — frontend M3-A unit tests (M1 Agent hooks + Settings) (#5434)
93b226b36 test(console): PR#1 — frontend M2 unit tests (Stores + Hooks + Control pages) (#5409)
8a22112d6 test(unit): chats module unit tests — W2 sprint (38 cases, Agentscope 2.0) (#5422)
6ac65a495 test(unit): crons module unit tests — W1 sprint (51 cases, Agentscope 2.0) (#5423)
ebb1c3c53 docs: rename HiClaw to AgentTeams in practice guides (#5636)
6bade8720 ci(integration): lift Windows nightly HTTP timeout + add per-test hang safeguard (#5627)
4b307e178 feat(channels): add per-channel no_text_debounce toggle (#5617)
a11db6a88 fix(desktop): stop plugin dep install storm and orphaned backends (#5570)
698954c5e fix: ut cross platform
13dee03e7 feat(console): mobile adaptation for Debug page (#5449)
d916bf65f feat(console): mobile adaptation for Security page (#5451)
202e44da4 feat(console): mobile adaptation for Agent Skills page (#5458)
c67bc1b9d feat(console): mobile adaptation for Skill Market page (#5459)
ccdce7c12 feat(console): make TokenUsage tables horizontally scrollable on mobile (#5463)
6545f03cd feat(console): mobile adaptation for Skill Pool page (#5464)
278f75ce7 feat(console): mobile adaptation for Voice Transcription settings page (#5470)
2d91627be feat(console): add mobile help menu to Header (#5444)
51735397b fix(layout): collapse sidebar on mobile first paint (#5444)
4724a61f1 fix(Chat): prevent ModelSelector dropdown overflow on mobile (#5445)
6138c1b74 fix(Chat): mobile header actions, session dropdown, and unified right drawers (#5446)
1549c5931 fix(chat): preserve assistant markdown newlines (#5538)
2585efa45 fix(tui): restore ACP commands and inline approvals (#5443)
c87230d37 refactor(readme): add trending badge (#5534)
9623f331f feat(skillpool): restore SkillPool styles (#5532)
935ce2ee7 feat(inbox): add source type filter for push messages (#5522)
5d955649c fix(matrix): use nio client.download for encrypted media (#5059)
3eafc0d3a fix: refine mcp tool name to pase openai api (#5485)
ea8100136 fix: fix tool input json decode (#5486)
66092b14e feat(provider): add OpenAI Response API provider (#5519)
1b825968e fix: inline $ref/$defs in tool schemas for GLM model compatibility (#5496)
0fc64794d fix(console): improve MCP access policy layout (#5213)
6afaf1774 chore: add DashScopeChatModel to ChatModelName literal type (#5513)
8854eaed2 fix(model): override format_tools for gemini (#5517)
1604db2f6 feat(skills): split Skills page into enabled/disabled sections with dual layout (#5521)
a4ab7c8ba fix(pack): repair desktop packaging builds (#5518)
4694de43b feat(console): mobile adaptation for Voice Transcription settings page (#5470)
23bac24f2 feat(console): mobile adaptation for Skill Pool page (#5464)
df791f64d feat(console): make TokenUsage tables horizontally scrollable on mobile (#5463)
b757c9746 feat(console): mobile adaptation for Skill Market page (#5459)
6847fa956 feat(console): mobile adaptation for Agent Skills page (#5458)
e3793f4d4 feat(console): mobile adaptation for Security page (#5451)
1406a32f3 feat(console): mobile adaptation for Debug page (#5449)
daad254db feat(Chat): mobile header actions, session dropdown, and unified right drawers (#5446)
2dca9216f feat(Chat): prevent ModelSelector dropdown overflow on mobile; add marquee for long model names (#5445)
882bc658e feat(console): mobile adaptation for sidebar, header, and page header (#5444)
```

---

## 六、仓库信息

- **上游源码仓库:** https://github.com/agentscope-ai/QwenPaw
- **Fork 仓库:** https://github.com/lecheng2018/QwenPaw
- **Fpk 封装仓库:** https://github.com/lecheng2018/QwenPaw-Fpk
- **FPK 下载:** https://github.com/lecheng2018/QwenPaw-Fpk/releases (需手动创建 Release 上传 FPK)
