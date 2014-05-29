# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/mpfr/Makefile.inc

PKG_NAME:=		mpfr
PKG_DESCR:=		multi precision library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		gmp
PKG_URL:=		http://www.mpfr.org/
PKG_OPTS:=		dev

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MPFR,mpfr,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

mpfr-install:
	${INSTALL_DIR} ${IDIR_MPFR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmpfr.so* ${IDIR_MPFR}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
