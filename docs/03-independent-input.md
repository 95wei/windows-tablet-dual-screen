# 03 独立键鼠

用 ProtoInputMultiPlex 向指定应用发送虚拟键鼠，让操作者可以继续用自己的实体键鼠。可以用临时窗口单独验证本模块。

## 前置条件

- Windows x64。此版本的便携包按普通用户启动，权限与目标应用相匹配。
- 选择得到授权的独立应用进程，用临时窗口或空白图做首轮测试。

## 配置

1. 从上游发布页下载 Windows x64 便携包。本文实测的是 `v0.1.0-rc.1`，上游标为实验版，安装包尚未签名。用发布页的 `SHA256SUMS.txt` 和本机的 `Get-FileHash -Algorithm SHA256` 对照。
2. 解压到可写目录，运行随包提供的 `launch-gui.cmd`。先按上游首轮测试指南创建虚拟键鼠和临时窗口。
3. 只绑定目标窗口所在的进程。通过 GUI 验证路由后，如果要让助手接入，按上游 MCP 指南启动 stdio 会话，或在 GUI 中明确授权 Agent Access。授权范围限本次所选窗口及所需操作。
4. 本人在主屏持续打字、移动鼠标。助手在副屏测试窗口点选、输入、拖动和滚动，分别确认事件到达了预期窗口。
5. 停止会话，核对键鼠恢复。CAD 测试结束后，等待命令执行完毕，再检查平移、缩放、选取及临时图纸清理。

## 实测结果

- 副屏临时窗口可接收后台点击与按键，主屏输入框未收到副屏测试按键。
- AutoCAD 原生控件模式下，中键拖动改变视图中心、滚轮改变视图高度，均已读回确认。
- 天正 T20 + AutoCAD 2023 入口：虚拟键盘执行命令、虚拟指针指定两点，生成天正墙体并读回对象类型为 `TCH_WALL`。

## 验证范围

- 天正墙体的点选与编辑面板未跑完，首次结束会话时未收到目标清理回执。
- 上游文档给出的默认紧急停止键是 `Ctrl+Alt+Shift+F11`，本项目未实按验证。
- 与 spacedesk 副屏、Moonlight 大屏两路同时运行时的键鼠隔离仍未验证；已验证的是单路对照下的并行输入。
- 工具会在所选进程加载输入组件。应用版本和权限会影响兼容性，应使用临时窗口先验收。

## 官方资料

- [v0.1.0-rc.1 发行包及摘要](https://github.com/KTheMan/ProtoInputMultiPlex/releases/tag/v0.1.0-rc.1)
- [第一次输入测试](https://github.com/KTheMan/ProtoInputMultiPlex/blob/main/docs/first-session.md)
- [MCP 接入说明](https://github.com/KTheMan/ProtoInputMultiPlex/blob/main/docs/agents.md)

返回 [项目说明](../README.md)
