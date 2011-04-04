# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXtst
PKG_VERSION:=		1.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		fd94ddca70e10eef4640e1f57b0301ee
PKG_DESCR:=		Xtst library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		recordproto libXi
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXTST LIBXTST_DEV
PKGSD_LIBXTST_DEV:=	Xtst headers
PKGSC_LIBXTST_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXTST,libxtst,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXTST_DEV,libxtst-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXTST_DEV},${PKGSC_LIBXTST_DEV}))

CONFIGURE_ARGS+= 	--disable-malloc0returnsnull

libxtst-install:
	${INSTALL_DIR} ${IDIR_LIBXTST}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXtst.so* ${IDIR_LIBXTST}/usr/lib

libxtst-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXTST_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXTST_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXTST_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBXTST_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
