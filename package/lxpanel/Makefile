# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lxpanel
PKG_VERSION:=		0.5.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		4c51dfdc0d15851d331905cfa00cc025
PKG_DESCR:=		graphical panel
PKG_SECTION:=		x11/lxde
PKG_DEPENDS:=		gdk-pixbuf menu-cache glib libintl libgtk
PKG_DEPENDS+=		libx11
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://openadk.org/distfiles/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LXPANEL,lxpanel,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lxpanel-install:
	$(INSTALL_DIR) $(IDIR_LXPANEL)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lxpanel* \
		$(IDIR_LXPANEL)/usr/bin
	$(INSTALL_DIR) $(IDIR_LXPANEL)/usr/share/lxpanel
	$(CP) $(WRKINST)/usr/share/lxpanel/* \
		$(IDIR_LXPANEL)/usr/share/lxpanel
	$(INSTALL_DIR) $(IDIR_LXPANEL)/usr/lib/lxpanel
	$(CP) $(WRKINST)/usr/lib/lxpanel/* \
		$(IDIR_LXPANEL)/usr/lib/lxpanel

include ${TOPDIR}/mk/pkg-bottom.mk
