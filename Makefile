include $(TOPDIR)/rules.mk

PKG_NAME:=ngrokc
PKG_VERSION:=20210901
PKG_RELEASE:=1
PKG_REV:=08dc67cf14f64af96b7b042175f08db127902869

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/dosgo/ngrok-c.git
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/ngrokc
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Web Servers/Proxies
	TITLE:=Secure tunnels to localhost(C++ port)
	URL:=https://github.com/dosgo/ngrok-c
	DEPENDS:=+libc +libpthread +libopenssl +libstdcpp
endef

define Build/Prepare
	$(call Build/Prepare/Default,)
	$(CP) $(PKG_BUILD_DIR)/Makefile.openssl $(PKG_BUILD_DIR)/Makefile
endef

define Package/ngrokc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ngrokc $(1)/usr/bin
endef


$(eval $(call BuildPackage,ngrokc))
