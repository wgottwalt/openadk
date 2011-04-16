# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		menu-cache
PKG_VERSION:=		0.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		bf5efbbb520bee2a35dc4f3005816cf0
PKG_DESCR:=		menu-cache
PKG_SECTION:=		libs
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://openadk.org/distfiles/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MENU_CACHE,menu-cache,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

menu-cache-install:
	$(INSTALL_DIR) $(IDIR_MENU_CACHE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmenu-cache.so* \
		$(IDIR_MENU_CACHE)/usr/lib
	$(INSTALL_DIR) $(IDIR_MENU_CACHE)/usr/libexec
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/menu-cache* \
		$(IDIR_MENU_CACHE)/usr/libexec

include ${TOPDIR}/mk/pkg-bottom.mk
