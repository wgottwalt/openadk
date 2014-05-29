# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gmp/Makefile.inc

PKG_NAME:=		gmp
PKG_DESCR:=		multiprecision arithmetic library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://gmplib.org/
PKG_BUILDDEP:=		m4-host flex-host bison-host
PKG_LIBNAME:=		libgmp
PKG_OPTS:=		dev

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGMP,libgmp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libgmp-install:
	${INSTALL_DIR} ${IDIR_LIBGMP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgmp.so* ${IDIR_LIBGMP}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
