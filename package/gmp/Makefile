# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gmp/Makefile.inc

PKG_DESCR:=		GNU multiprecision arithmetic library
PKG_SECTION:=		libs
PKG_URL:=		http://gmplib.org/

PKG_SUBPKGS:=		LIBGMP LIBGMP_DEV
PKGSC_LIBGMP_DEV:=	devel
PKGSD_LIBGMP_DEV:=	libgmp headers

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGMP,libgmp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBGMP_DEV,libgmp-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBGMP_DEV},${PKGSC_LIBGMP_DEV}))

libgmp-install:
	${INSTALL_DIR} ${IDIR_LIBGMP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgmp.so* ${IDIR_LIBGMP}/usr/lib

libgmp-dev-install:
	${INSTALL_DIR} ${IDIR_LIBGMP_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBGMP_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
