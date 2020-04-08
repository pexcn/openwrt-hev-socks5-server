include $(TOPDIR)/rules.mk

PKG_NAME:=hev-socks5-server
PKG_VERSION:=1.9.4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/heiher/hev-socks5-server.git
PKG_SOURCE_VERSION:=ec83e00815e1e4f7399464f54bf5111815b4b200
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
#PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=pexcn <i@pexcn.me>

include $(INCLUDE_DIR)/package.mk

define Package/hev-socks5-server
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A simple, lightweight socks5 server for Unix
	URL:=https://github.com/heiher/hev-socks5-server
endef

define Package/hev-socks5-server/description
A simple, lightweight socks5 server for Unix.
endef

define Package/hev-socks5-server/conffiles
/etc/config/hev-socks5-server
/etc/hev-socks5-server.yml
endef

MAKE_FLAGS += \
	ENABLE_STATIC=1

define Package/hev-socks5-server/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/hev-socks5-server $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) files/hev-socks5-server.init $(1)/etc/init.d/hev-socks5-server
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) files/hev-socks5-server.config $(1)/etc/config/hev-socks5-server
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) files/hev-socks5-server.yml $(1)/etc
endef

$(eval $(call BuildPackage,hev-socks5-server))
