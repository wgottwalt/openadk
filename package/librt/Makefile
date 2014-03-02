# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

ifeq ($(ADK_TARGET_LIB_GLIBC),y)
include ${TOPDIR}/toolchain/glibc/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC),y)
include ${TOPDIR}/toolchain/uClibc/Makefile.inc
endif
ifeq ($(ADK_NATIVE),y)
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
endif

PKG_NAME:=		librt
PKG_DESCR:=		Realtime library
PKG_SECTION:=		libs
PKG_OPTS:=		noremove

NO_DISTFILES:=		1

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBRT,librt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

librt-install:
ifeq ($(ADK_NATIVE),)
	${INSTALL_DIR} ${IDIR_LIBRT}/$(ADK_TARGET_LIBC_PATH)
ifeq ($(ADK_TARGET_LIB_MUSL),)
	${CP} ${STAGING_TARGET_DIR}/lib/librt*.so* ${IDIR_LIBRT}/$(ADK_TARGET_LIBC_PATH)
endif
endif

include ${TOPDIR}/mk/pkg-bottom.mk
