# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xsetroot
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_HASH:=		6cdd48757d18835251124138b4a8e4008c3bbc51cf92533aa39c6ed03277168b
PKG_DESCR:=		set root window
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		xbitmaps libx11 libxmu libxcursor
PKG_BUILDDEP:=		xbitmaps libXcursor libXmu
PKG_SITES:=		http://www.x.org/releases/individual/app/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XSETROOT,xsetroot,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xsetroot-install:
	$(INSTALL_DIR) $(IDIR_XSETROOT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xsetroot \
		$(IDIR_XSETROOT)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
