# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xkeyboard-config
PKG_VERSION:=		2.11
PKG_RELEASE:=		1
PKG_HASH:=		e7125460892c2b5c3a8d843cb18c24b60c46051e925c2888a61fa672a2f76d76
PKG_DESCR:=		keyboard config
PKG_SECTION:=		x11/misc
PKG_BUILDDEP:=		util-macros xkbcomp
PKG_SITES:=		http://www.x.org/releases/individual/data/xkeyboard-config/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XKEYBOARD_CONFIG,xkeyboard-config,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf

xkeyboard-config-install:
	${INSTALL_DIR} ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb
	${CP} ${WRKINST}/usr/share/X11/xkb/* \
		${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb
	rm -rf ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb/symbols/sun_vndr

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
