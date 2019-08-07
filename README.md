HevSocks5Server for OpenWrt
---

## 简介

本项目是 [hev-socks5-server][UPSTREAM_PROJECT] 在 OpenWrt 上的移植。

## 编译

- 从 OpenWrt 的 [SDK][OPENWRT_SDK] 编译

    ```bash
    # 以 ar71xx 平台为例
    tar xfJ openwrt-sdk-18.06.4-ar71xx-generic_gcc-7.3.0_musl.Linux-x86_64.tar.xz
    cd openwrt-sdk-*
    
    # 获取 Makefile
    git clone https://github.com/pexcn/openwrt-hev-socks5-server.git package/hev-socks5-server
    
    # 选中要编译的包 Network -> hev-socks5-server
    make menuconfig
    
    # 开始编译
    make package/hev-socks5-server/compile V=s
    ```

[UPSTREAM_PROJECT]: https://github.com/heiher/hev-socks5-server
[OPENWRT_SDK]: https://openwrt.org/docs/guide-developer/obtain.firmware.sdk
