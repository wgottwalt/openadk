# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libpng
PKG_VERSION:=		1.5.15
PKG_RELEASE:=		1
PKG_MD5SUM:=		ea24254980fd820964a710e4d2a947c7
PKG_DESCR:=		A library for reading/writing PNG images
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.libpng.org/pub/png/libpng.html
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libpng/}

PKG_ARCH_DEPENDS:=	!m68k

PKG_SUBPKGS:=		LIBPNG LIBPNG_DEV
PKGSD_LIBPNG_DEV:=	development files for libpng
PKGSC_LIBPNG_DEV:=	devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPNG,libpng,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBPNG_DEV,libpng-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBPNG_DEV},${PKGSC_LIBPNG_DEV},${PKG_OPTS}))

TARGET_CFLAGS:=		$(filter-out -flto,$(TARGET_CFLAGS))

libpng-install:
	${INSTALL_DIR} ${IDIR_LIBPNG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpng*.so* ${IDIR_LIBPNG}/usr/lib

libpng-dev-install:
	${INSTALL_DIR} ${IDIR_LIBPNG_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBPNG_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBPNG_DEV}/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBPNG_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
