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

PKG_NAME:=		libthread-db
PKG_DESCR:=		posix threads library for gdb/gdbserver
PKG_SECTION:=		libs/misc
PKG_OPTS:=		nostrip

PKG_CFLINE_LIBTHREAD_DB:=depends on ADK_PACKAGE_GDB || ADK_PACKAGE_GDBSERVER

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTHREAD_DB,libthread-db,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	${INSTALL_DIR} ${IDIR_LIBTHREAD_DB}/lib
ifeq ($(ADK_TARGET_LIB_MUSL),)
ifeq (${ADK_TARGET_UCLINUX},)
	${CP} ${STAGING_TARGET_DIR}/lib/libthread_db*.so* ${IDIR_LIBTHREAD_DB}/lib
endif
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
