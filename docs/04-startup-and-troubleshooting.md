# 04 启动与排错

核对 Windows 服务自动启动，以及两路画面断开时的排查顺序。

## 前置条件

根据所用模块，在电脑安装 Sunshine 或 spacedesk Driver，在平板安装对应 Viewer。本节也可以用于只开一路画面的环境。

## 日常启动

1. 在 Windows 的「服务」里检查 `SunshineService` 和 `spacedeskService`。本项目使用的两项服务已设为自动启动。
2. 平板打开 Moonlight V+ 连接主屏，再打开 spacedesk Viewer 连接副屏。本项目试过清理平板后台后重新连接，两路画面恢复。
3. 从仓库根目录运行 [只读检查脚本](../scripts/Test-DualScreenHost.ps1)。

```powershell
.\scripts\Test-DualScreenHost.ps1
```

脚本读取服务状态、常用 TCP 端口监听和活动显示器。它用于本机检查，平板是否能连接仍要从平板上验证。

## 排查顺序

- 连不上时先查对应服务。确认平板和电脑在局域网能互通，再在 Viewer 用「＋」输入电脑当前的局域网 IPv4。
- spacedesk 使用 TCP 28252。按前述副屏指南检查放行规则。
- 画面发灰或偏色时，用关闭 HDR 的 1080p、60 FPS、H.264 重新对照，再逐项调整画质。
- 外接屏亮度从显示器自己的菜单调整。可用平板非串流的白底画面和串流画面做对照。

## 验证范围

- 用户已确认两路画面同时显示和清后台后重连。Windows 端已核对两个服务均为自动启动且当时在运行。
- 两路同时工作时的 CAD 键鼠隔离、Windows 重启后的自动恢复、笔记本内屏熄灭后的表现仍待验证。
- Tailscale 是选做项。已核对设备间可达，跨网的画面与输入待实测。

## 官方资料

- [Sunshine 文档](https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2getting__started.html)
- [spacedesk 防火墙设置](https://manual.spacedesk.net/FirewallSettingsonPrimaryMachine.html)
- [Moonlight V+ 发布页](https://github.com/qiin2333/moonlight-vplus/releases)

返回 [项目说明](../README.md)
