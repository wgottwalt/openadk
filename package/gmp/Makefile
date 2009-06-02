# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gmp/Makefile.inc

PKG_DESCR:=		GNU multiprecision arithmetic library
PKG_SECTION:=		libs
PKG_URL:=		http://gmplib.org

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGMP,libgmp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBGMP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgmp.so.* ${IDIR_LIBGMP}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
