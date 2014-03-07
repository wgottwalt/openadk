# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gcc/Makefile.inc

PKG_NAME:=		libgcc
PKG_DESCR:=		GCC library
PKG_SECTION:=		libs

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGCC,libgcc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	${INSTALL_DIR} ${IDIR_LIBGCC}/$(ADK_TARGET_LIBC_PATH)
ifeq ($(ADK_LINUX_SH),y)
ifeq ($(ADK_TARGET_LIB_GLIBC),y)
	${CP} ${STAGING_TARGET_DIR}/lib/libgcc*.so* ${IDIR_LIBGCC}/$(ADK_TARGET_LIBC_PATH)
else
	${CP} ${STAGING_TARGET_DIR}/lib/m4-nofpu/libgcc*.so* ${IDIR_LIBGCC}/$(ADK_TARGET_LIBC_PATH)
endif
else
	${CP} ${STAGING_TARGET_DIR}/$(ADK_TARGET_LIBC_PATH)/libgcc*.so* ${IDIR_LIBGCC}/$(ADK_TARGET_LIBC_PATH)
endif

include ${TOPDIR}/mk/pkg-bottom.mk
