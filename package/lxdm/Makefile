# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lxdm
PKG_VERSION:=		0.3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		1d0688e088edab7c3c563263eb2f9654
PKG_DESCR:=		LXDE display manager
PKG_SECTION:=		x11/lxde
PKG_BUILDDEP:=		libX11 glib gtk+ ConsoleKit
PKG_DEPENDS:=		libx11 glib libgtk consolekit dbus
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://openadk.org/distfiles/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LXDM,lxdm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lxdm-install:
	$(INSTALL_DIR) $(IDIR_LXDM)/etc
	$(CP) $(WRKINST)/etc/* $(IDIR_LXDM)/etc
	$(INSTALL_DIR) $(IDIR_LXDM)/usr/libexec
	$(CP) $(WRKINST)/usr/libexec/* \
		$(IDIR_LXDM)/usr/libexec
	$(INSTALL_DIR) $(IDIR_LXDM)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/lxdm* \
		$(IDIR_LXDM)/usr/sbin
	$(INSTALL_DIR) $(IDIR_LXDM)/usr/share/lxdm/themes
	$(CP) $(WRKINST)/usr/share/lxdm/themes/* \
		$(IDIR_LXDM)/usr/share/lxdm/themes
	$(INSTALL_DIR) $(IDIR_LXDM)/usr/share/backgrounds
	$(CP) ./files/openadk.png \
		$(IDIR_LXDM)/usr/share/backgrounds/default.png

include ${TOPDIR}/mk/pkg-bottom.mk
