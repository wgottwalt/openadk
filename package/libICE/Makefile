# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libICE
PKG_VERSION:=		1.0.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		4b8dae73fce37e994c3a6fa05d6db7ca
PKG_DESCR:=		Inter-Client Exchange library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xtrans xproto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBICE LIBICE_DEV
PKGSD_LIBICE_DEV:=	Inter-Client Exchange headers
PKGSC_LIBICE_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBICE,libice,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBICE_DEV,libice-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBICE_DEV},${PKGSC_LIBICE_DEV}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))

libice-install:
	${INSTALL_DIR} ${IDIR_LIBICE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libICE.so* ${IDIR_LIBICE}/usr/lib

libice-dev-install:
	${INSTALL_DIR} ${IDIR_LIBICE_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBICE_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBICE_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBICE_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
