# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/mpfr/Makefile.inc

PKG_DESCR:=		multi precision library
PKG_SECTION:=		libs
PKG_URL:=		http://www.mpfr.org

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MPFR,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_MPFR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmpfr.so.* ${IDIR_MPFR}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
