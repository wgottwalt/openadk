# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

ifeq ($(ADK_TARGET_LIB_GLIBC),y)
include ${ADK_TOPDIR}/toolchain/glibc/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG),y)
include ${ADK_TOPDIR}/toolchain/uclibc-ng/Makefile.inc
endif

PKG_NAME:=		librt
PKG_DESCR:=		realtime library
PKG_SECTION:=		base/libs
PKG_OPTS:=		noremove

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBRT,librt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

librt-install:
	${INSTALL_DIR} ${IDIR_LIBRT}/$(ADK_TARGET_LIBC_PATH)
ifeq ($(ADK_TARGET_LIB_MUSL),)
ifeq ($(ADK_TARGET_USE_STATIC_LIBS),)
ifeq ($(ADK_TARGET_BINFMT_FLAT),)
	-${CP} ${STAGING_TARGET_DIR}/lib/librt*.so* ${IDIR_LIBRT}/$(ADK_TARGET_LIBC_PATH)
endif
endif
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
