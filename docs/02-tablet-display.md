# 02 平板副屏

用 spacedesk 把 Windows 扩展屏送到平板。这个模块也可以单独使用，适合只想把平板当副屏的情况。

## 前置条件

- Windows 10/11 x64 主机，具备管理员权限。
- 平板与主机在同一局域网（或实际可达的网络）。
- 平板安装 spacedesk Viewer（Android 包名 `ph.spacedesk.beta`）。

## 配置

1. 主机从官方下载页取得 spacedesk Driver 安装包，按向导安装；厂商手册要求 Windows 10/11 安装完成后重启。
2. 平板从 Google Play 安装 Viewer。平板没有 Play 商店时，可用 F-Droid 发行的 Aurora Store，选匿名登录，搜索 `spacedesk`，从 Google Play 取 Datronicsoft 的 Viewer。匿名会话的可用性以平板实际结果为准。
3. 打开 Viewer，点选列表中的主机；发现不到时点「＋」手动填写 `<主机局域网 IPv4>`（换成主机当前地址）。
4. 在 Windows 显示设置中选择「扩展这些显示器」。按照实际摆放排列两块屏。本项目将副屏排在主屏下方、左边对齐。
5. 设置 → 个性化 → 背景，壁纸选择「适应」，让整张图按比例完整显示。
6. 如果平板只看画面，在 Viewer 的 Menu → Input Devices 里关闭用不到的触屏、笔和键盘转发。
7. spacedesk 使用 TCP 28252。连接失败时，检查防火墙是否允许平板访问这个端口。按实际需求限制允许的来源，保留其他防火墙保护。

## 验证

- Windows 出现第二块显示器，平板能看到副屏内容。
- 把窗口拖到副屏可见，分辨率符合预期。
- 与主屏串流同时运行时，两路画面互不顶替。

## 验证范围

- Android Viewer 的输入能力以官方设备输入表为准。本项目把此路用作平板副屏。
- 电脑更换网络地址后，更新 Viewer 里保存的地址。
- 跨网（如 Tailscale）属于选做方向，本项目未验证其画面表现。

## 官方资料

- [spacedesk 下载](https://www.spacedesk.net/download/) · [安装与配置手册](https://manual.spacedesk.net/)
- [Google Play 上的 spacedesk Viewer](https://play.google.com/store/apps/details?id=ph.spacedesk.beta)
- [F-Droid 上的 Aurora Store](https://f-droid.org/packages/com.aurora.store/)

返回 [项目说明](../README.md)
