# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

ifeq ($(ADK_TARGET_LIB_GLIBC),y)
include ${TOPDIR}/toolchain/glibc/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC),y)
include ${TOPDIR}/toolchain/uclibc/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC),y)
include ${TOPDIR}/toolchain/musl/Makefile.inc
endif

PKG_NAME:=		libssp
PKG_DESCR:=		stack smashing protection library
PKG_SECTION:=		libs/misc
PKG_OPTS:=		noremove

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSSP,libssp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

libssp-install:
	${INSTALL_DIR} ${IDIR_LIBSSP}/$(ADK_TARGET_LIBC_PATH)
	${CP} ${STAGING_TARGET_DIR}/lib/libssp.so* ${IDIR_LIBSSP}/$(ADK_TARGET_LIBC_PATH)

include ${TOPDIR}/mk/pkg-bottom.mk
