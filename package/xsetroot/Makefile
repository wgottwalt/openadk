# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xsetroot
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_HASH:=		318436be836d2b4c04d9acab4a3538744e07c8891b24f7c4a3823b6ea4c8275f
PKG_DESCR:=		set root window
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		xbitmaps libx11 libxmu libxcursor
PKG_BUILDDEP:=		xbitmaps libXcursor libXmu
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XSETROOT,xsetroot,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xsetroot-install:
	$(INSTALL_DIR) $(IDIR_XSETROOT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xsetroot \
		$(IDIR_XSETROOT)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
