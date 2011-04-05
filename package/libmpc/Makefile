# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/mpc/Makefile.inc

PKG_DESCR:=		GNU multiprecision arithmetic library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		gmp mpfr
PKG_URL:=		http://www.multiprecision.org/

PKG_SUBPKGS:=		LIBMPC LIBMPC_DEV

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBMPC,libmpc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBMPC_DEV,libmpc-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

libmpc-install:
	${INSTALL_DIR} ${IDIR_LIBMPC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmpc.so* ${IDIR_LIBMPC}/usr/lib

libmpc-dev-install:
	${INSTALL_DIR} ${IDIR_LIBMPC_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBMPC_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
