# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xkeyboard-config
PKG_VERSION:=		1.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		f049d15f1e9d95776a940f222df9404b
PKG_DESCR:=		X keyboard config
PKG_SECTION:=		x11/libs
PKG_BUILDDEP+=		xkbcomp
PKG_SITES:=		http://xlibs.freedesktop.org/xkbdesc/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XKEYBOARD_CONFIG,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb
	${CP} ${WRKINST}/usr/share/X11/xkb/* \
		${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb
	rm ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb/rules/*.lst
	rm ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb/rules/*.xml
	rm -rf ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb/symbols/sun_vndr

include ${TOPDIR}/mk/pkg-bottom.mk
