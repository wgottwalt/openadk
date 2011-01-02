# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gcc/Makefile.inc

PKG_NAME:=		libgcc
PKG_DESCR:=		GCC library
PKG_SECTION:=		libs
PKG_DFLT_LIBGCC:=	y if !ADK_TOOLCHAIN_ONLY

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGCC,libgcc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
ifeq ($(ADK_NATIVE),)
	${INSTALL_DIR} ${IDIR_LIBGCC}/lib
	${CP} ${STAGING_TARGET_DIR}/lib/libgcc*.so* ${IDIR_LIBGCC}/lib
endif

include ${TOPDIR}/mk/pkg-bottom.mk
