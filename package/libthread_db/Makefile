# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

ifeq ($(ADK_TARGET_LIB_GLIBC),y)
include ${TOPDIR}/toolchain/glibc/Makefile.inc
else
ifeq ($(ADK_TARGET_LIB_EGLIBC),y)
include ${TOPDIR}/toolchain/eglibc/Makefile.inc
else
include ${TOPDIR}/toolchain/uClibc/Makefile.inc
endif
endif

PKG_NAME:=		libthread-db
PKG_DESCR:=		POSIX threads library for gdb/gdbserver
PKG_SECTION:=		libs
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTHREAD_DB,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	${INSTALL_DIR} ${IDIR_LIBTHREAD_DB}/lib
	${CP} ${STAGING_DIR}/lib/libthread_db*.so* ${IDIR_LIBTHREAD_DB}/lib

include ${TOPDIR}/mk/pkg-bottom.mk
