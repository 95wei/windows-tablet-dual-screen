# 01 主屏串流

把 Windows 主屏经局域网串流到平板，再通过有线连接送到外接大屏。大屏上的键鼠操作经 Moonlight V+ 回传给 Windows。

## 前置条件

- Windows 主机与平板在同一局域网。
- 平板支持 USB-C 视频输出（DisplayPort Alt Mode），外接显示器可用。
- 平板安装 Moonlight V+（普通 nonRoot 包，包名 `com.limelight.qiin`，可与官方 Moonlight 并存）。

## 配置

1. 安装 Sunshine，用电脑本机的管理页创建自己的账号和密码。局域网方案只需要设备间互通。
2. 平板打开 Moonlight V+，选中电脑。自动发现失败时，用「＋」输入电脑当前的局域网 IPv4。点选主机后，平板会显示四位 PIN。
3. 在电脑本机浏览器打开 `https://localhost:47990/pin`，输入 PIN 完成配对。
4. 先在平板串流桌面，用 1080p、60 FPS、H.264、关闭 HDR 起步，确认画面与声音正常。
5. 接好外接屏，在设置 → 画面显示打开「把串流发送到外接显示器」，重新进入 Desktop。大屏应独立显示 Windows 桌面，平板内屏上的 V+ 界面可能呈黑色。
6. 在设置 → 主机 →「Moonlight 进入后台时」选「保持串流连接」。有后台声音需求时选「保持连接并播放声音」。

## 验证

- 大屏显示 Windows 主屏，外接键鼠可操作远程主屏。
- 平板切到其他应用，大屏应该持续刷新。分别试鼠标点击和键盘输入，切回后再检查连接状态。
- 移动鼠标时外接屏光标跟随（本版外屏使用主机合成光标）。

## 验证范围

- 「保持串流连接」设置的是应用进后台时的连接行为。外接画面和键鼠还受平板系统影响。本项目用户确认整体成功，外屏刷新、点击和打字的细节还没有逐项记录。
- 拔掉外接屏可能直接结束当前串流。
- HDR、高刷新率需要主机、平板、显示器三端能力匹配。

## 官方资料

- [Sunshine 安装与配对](https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2getting__started.html)
- [Moonlight V+ 发布页](https://github.com/qiin2333/moonlight-vplus/releases)
- [Moonlight V+ 外接屏说明](https://github.com/qiin2333/moonlight-vplus/blob/master/docs/VPLUS_FEATURES.md)

返回 [项目说明](../README.md)
