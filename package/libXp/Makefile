# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXp
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		a960c831f11e6b4249fde78a5b969000
PKG_DESCR:=		X Print library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXext printproto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXP LIBXP_DEV
PKGSD_LIBXP_DEV:=	X Print headers
PKGSC_LIBXP_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXP,libpt,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXP_DEV,libpt-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXP_DEV},${PKGSC_LIBXP_DEV}))

libxp-install:
	${INSTALL_DIR} ${IDIR_LIBXP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXp.so* ${IDIR_LIBXP}/usr/lib

libxp-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXP_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXP_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXP_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBXP_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
