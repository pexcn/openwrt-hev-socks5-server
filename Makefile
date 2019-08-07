include $(TOPDIR)/rules.mk

PKG_NAME:=hev-socks5-server
PKG_VERSION:=1.8.8
PKG_RELEASE:=1
PKG_USE_MIPS16:=0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/heiher/hev-socks5-server.git
PKG_SOURCE_VERSION:=901d35de7787addfb08df472748bded050eef8b5
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=pexcn <i@pexcn.me>

include $(INCLUDE_DIR)/package.mk

define Package/hev-socks5-server
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A simple, lightweight socks5 server for Unix.
	URL:=https://github.com/heiher/hev-socks5-server
endef

define Package/hev-socks5-server/description
A simple, lightweight socks5 server for Unix.
endef

MAKE_FLAGS += \
	ENABLE_STATIC=1

define Package/hev-socks5-server/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/hev-socks5-server $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) files/config.ini $(1)/etc/hev-socks5-server.ini
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) files/hev-socks5-server.init $(1)/etc/init.d/hev-socks5-server
endef

$(eval $(call BuildPackage,hev-socks5-server))
