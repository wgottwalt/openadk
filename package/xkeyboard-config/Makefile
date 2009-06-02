# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xkeyboard-config
PKG_VERSION:=		1.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		889e6e10eb7449bf33a5423c40369da5
PKG_DESCR:=		X keyboard config
PKG_SECTION:=		x11
PKG_SITES:=		http://xlibs.freedesktop.org/xkbdesc/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XKEYBOARD_CONFIG,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb
	${CP} ${WRKINST}/usr/share/X11/xkb/* ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb
	rm ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb/rules/*.lst 
	rm ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb/rules/*.xml
	rm -rf ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb/symbols/sun_vndr

include ${TOPDIR}/mk/pkg-bottom.mk
