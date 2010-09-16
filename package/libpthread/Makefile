# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

ifeq ($(ADK_TARGET_LIB_GLIBC),y)
include ${TOPDIR}/toolchain/glibc/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_EGLIBC),y)
include ${TOPDIR}/toolchain/eglibc/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC),y)
include ${TOPDIR}/toolchain/uClibc/Makefile.inc
endif

PKG_NAME:=		libpthread
PKG_DESCR:=		POSIX threading library
PKG_SECTION:=		libs
NO_DISTFILES:=		1

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPTHREAD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
ifeq ($(ADK_NATIVE),)
	${INSTALL_DIR} ${IDIR_LIBPTHREAD}/lib
	${CP} ${STAGING_DIR}/lib/libpthread*.so* ${IDIR_LIBPTHREAD}/lib
	cd $(IDIR_LIBPTHREAD)/lib && ln -sf libpthread.so.0 libpthread.so
endif

include ${TOPDIR}/mk/pkg-bottom.mk
