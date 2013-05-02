# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xkeyboard-config
PKG_VERSION:=		2.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		9a77cb477aec1123720332a091255f25
PKG_DESCR:=		X keyboard config
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xkbcomp
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XKEYBOARD_CONFIG,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb
	${CP} ${WRKINST}/usr/share/X11/xkb/* \
		${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb
	rm -rf ${IDIR_XKEYBOARD_CONFIG}/usr/share/X11/xkb/symbols/sun_vndr

include ${TOPDIR}/mk/pkg-bottom.mk
