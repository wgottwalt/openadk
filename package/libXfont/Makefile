# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXfont
PKG_VERSION:=		1.4.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		c508998fba44b2b089f2952eb4418420
PKG_DESCR:=		X font Library
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		libfreetype
PKG_BUILDDEP:=		freetype fontcacheproto fontsproto libfontenc xtrans
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXFONT LIBXFONT_DEV
PKGSD_LIBXFONT_DEV:=	X font headers
PKGSC_LIBXFONT_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFONT,libxfont,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXFONT_DEV,libxfont-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXFONT_DEV},${PKGSC_LIBXFONT_DEV}))

CONFIGURE_ENV+=		ac_cv_path_XMLTO=true

libxfont-install:
	${INSTALL_DIR} ${IDIR_LIBXFONT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXfont.so* ${IDIR_LIBXFONT}/usr/lib

libxfont-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXFONT_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xfont.pc \
		${IDIR_LIBXFONT_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
