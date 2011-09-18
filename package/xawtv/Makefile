# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xawtv
PKG_VERSION:=		3.102
PKG_RELEASE:=		1
PKG_MD5SUM:=		3ee0f1d682d7e5734121bc420a74efd5
PKG_DESCR:=		Video & Webcam application
PKG_BUILDDEP:=		libXinerama v4l-utils
PKG_DEPENDS:=		libxinerama libv4l
PKG_SECTION:=		x11/apps
PKG_SITES:=		http://linuxtv.org/downloads/xawtv/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XAWTV,xawtv,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

xawtv-install:
	$(INSTALL_DIR) $(IDIR_XAWTV)/etc/X11/app-defaults
	$(INSTALL_DATA) $(WRKINST)/etc/X11/app-defaults/Xawtv \
		$(IDIR_XAWTV)/etc/X11/app-defaults
	$(INSTALL_DIR) $(IDIR_XAWTV)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xawtv \
		$(IDIR_XAWTV)/usr/bin
	$(INSTALL_DIR) $(IDIR_XAWTV)/usr/lib/xawtv
	$(CP) $(WRKINST)/usr/lib/xawtv/*.so \
		$(IDIR_XAWTV)/usr/lib/xawtv
	$(INSTALL_DIR) $(IDIR_XAWTV)/usr/share/xawtv
	$(CP) $(WRKINST)/usr/share/xawtv/* \
		$(IDIR_XAWTV)/usr/share/xawtv

include ${TOPDIR}/mk/pkg-bottom.mk
