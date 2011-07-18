# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libcapi20
PKG_VERSION:=		3.0.5-cm2
PKG_RELEASE:=		1
PKG_MD5SUM:=		cf81d182fe7a4dbab61bce929824db2c
PKG_DESCR:=		CAPI library
PKG_SECTION:=		libs
PKG_URL:=		ftp://ftp.melware.net/capi-utils/
PKG_SITES:=		ftp://ftp.melware.net/capi-utils/

PKG_SUBPKGS:=		LIBCAPI20 LIBCAPI20_DEV
PKGSD_LIBCAPI20_DEV:=	header files for libcapi20 library
PKGSC_LIBCAPI20_DEV:=	devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBCAPI20,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBCAPI20_DEV,${PKG_NAME}-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBCAPI20_DEV},${PKGSC_LIBCAPI20_DEV},${PKG_OPTS}))

libcapi20-install:
	${INSTALL_DIR} ${IDIR_LIBCAPI20}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcapi*.so* ${IDIR_LIBCAPI20}/usr/lib

libcapi20-dev-install:
	${INSTALL_DIR} ${IDIR_LIBCAPI20_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBCAPI20_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
