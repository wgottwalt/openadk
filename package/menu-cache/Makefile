# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		menu-cache
PKG_VERSION:=		0.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		bf5efbbb520bee2a35dc4f3005816cf0
PKG_DESCR:=		menu-cache library
PKG_SECTION:=		x11/lxde
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SUBPKGS:=		MENU_CACHE MENU_CACHE_DEV

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MENU_CACHE,menu-cache,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,MENU_CACHE_DEV,menu-cache-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

menu-cache-install:
	$(INSTALL_DIR) $(IDIR_MENU_CACHE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmenu-cache.so* \
		$(IDIR_MENU_CACHE)/usr/lib
	$(INSTALL_DIR) $(IDIR_MENU_CACHE)/usr/libexec
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/menu-cache* \
		$(IDIR_MENU_CACHE)/usr/libexec

menu-cache-dev-install:
	$(INSTALL_DIR) $(IDIR_MENU_CACHE_DEV)/usr/lib/pkgconfig
	$(CP) $(WRKINST)/usr/lib/pkgconfig/*.pc \
		$(IDIR_MENU_CACHE_DEV)/usr/lib/pkgconfig
	$(INSTALL_DIR) $(IDIR_MENU_CACHE_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_MENU_CACHE_DEV)/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
