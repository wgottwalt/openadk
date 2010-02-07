# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xkeyboard-config
PKG_VERSION:=		1.7
PKG_RELEASE:=		1
PKG_BUILDDEP+=		xkbcomp
PKG_MD5SUM:=		c024a6e2a5b8c4ce3d9d1f1286466163
PKG_DESCR:=		X keyboard config
PKG_SECTION:=		x11
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
