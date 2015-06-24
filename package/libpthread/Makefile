# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

ifeq ($(ADK_TARGET_LIB_GLIBC),y)
include ${ADK_TOPDIR}/toolchain/glibc/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_MUSL),y)
include ${ADK_TOPDIR}/toolchain/musl/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG),y)
include ${ADK_TOPDIR}/toolchain/uclibc-ng/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC),y)
include ${ADK_TOPDIR}/toolchain/uclibc/Makefile.inc
endif

PKG_NAME:=		libpthread
PKG_DESCR:=		posix threading library
PKG_SECTION:=		base/libs
PKG_OPTS:=		noremove nostaging noscripts

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPTHREAD,libpthread,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

libpthread-install:
ifneq ($(ADK_TARGET_LIB_MUSL),y)
ifneq ($(ADK_TARGET_USE_STATIC_LIBS),y)
ifneq ($(ADK_TARGET_WITHOUT_THREADS),y)
	${INSTALL_DIR} ${IDIR_LIBPTHREAD}/$(ADK_TARGET_LIBC_PATH)
	${CP} ${STAGING_TARGET_DIR}/lib/libpthread*.so* ${IDIR_LIBPTHREAD}/$(ADK_TARGET_LIBC_PATH)
endif
endif
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
