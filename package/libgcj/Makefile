# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gcc/Makefile.inc

PKG_NAME:=		libgcj
PKG_DESCR:=		GCJ runtime library
PKG_SECTION:=		libs

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGCJ,libgcj,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

libgcj-install:
ifeq ($(ADK_NATIVE),)
	${INSTALL_DIR} ${IDIR_LIBGCJ}/lib
	${CP} ${STAGING_TARGET_DIR}/lib/libgcj*.so* ${IDIR_LIBGCJ}/lib
endif

include ${TOPDIR}/mk/pkg-bottom.mk
