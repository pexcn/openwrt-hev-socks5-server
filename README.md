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

## 许可证

```
Copyright (C) 2019, pexcn <i@pexcn.me>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
```

[UPSTREAM_PROJECT]: https://github.com/heiher/hev-socks5-server
[OPENWRT_SDK]: https://openwrt.org/docs/guide-developer/obtain.firmware.sdk
