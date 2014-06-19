# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xkeyboard-config
PKG_VERSION:=		2.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		e3defd29cc464cc1a1dfa0eebaca53b1
PKG_DESCR:=		keyboard config
PKG_SECTION:=		x11/misc
PKG_BUILDDEP:=		util-macros xkbcomp
PKG_SITES:=		http://www.x.org/releases/individual/data/xkeyboard-config/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XKEYBOARD_CONFIG,xkeyboard-config,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf

xkeyboard-config-install:
	${INSTALL_DIR} ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb
	${CP} ${WRKINST}/usr/share/X11/xkb/* \
		${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb
	rm -rf ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb/symbols/sun_vndr

include ${TOPDIR}/mk/pkg-bottom.mk
