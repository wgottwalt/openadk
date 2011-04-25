# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lxmenu-data
PKG_VERSION:=		0.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		75b7fee16ef05e96b7ce3607eee3cc93
PKG_DESCR:=		LXDE menu data
PKG_SECTION:=		x11/lxde
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://openadk.org/distfiles/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LXMENU_DATA,lxmenu-data,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lxde-common-install:
	$(INSTALL_DIR) $(IDIR_LXMENU_DATA)/etc/xdg
	$(CP) $(WRKINST)/etc/xdg/* $(IDIR_LXMENU_DATA)/etc/xdg
	$(INSTALL_DIR) $(IDIR_LXMENU_DATA)/usr/share/desktop-directories
	$(CP) $(WRKINST)/usr/share/desktop-directories/* \
		$(IDIR_LXMENU_DATA)/usr/share/desktop-directories

include ${TOPDIR}/mk/pkg-bottom.mk
