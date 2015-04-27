# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk
include ${ADK_TOPDIR}/toolchain/mpc/Makefile.inc

PKG_NAME:=		mpc
PKG_DESCR:=		multiprecision arithmetic library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		gmp mpfr
PKG_URL:=		http://www.multiprecision.org/
PKG_LIBNAME:=		libmpc
PKG_OPTS:=		dev

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBMPC,libmpc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_LDFLAGS+=	-lm

libmpc-install:
	${INSTALL_DIR} ${IDIR_LIBMPC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmpc.so* ${IDIR_LIBMPC}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
