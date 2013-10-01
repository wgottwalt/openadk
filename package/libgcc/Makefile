# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gcc/Makefile.inc

PKG_NAME:=		libgcc
PKG_DESCR:=		GCC library
PKG_SECTION:=		libs
#PKG_DFLT_LIBGCC:=	y if !ADK_TOOLCHAIN_ONLY

NO_DISTFILES:=		1

PKG_ARCH_DEPENDS:=	!avr32

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGCC,libgcc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
ifeq ($(ADK_NATIVE),)
	${INSTALL_DIR} ${IDIR_LIBGCC}/$(ADK_TARGET_LIBC_PATH)
ifeq ($(ADK_LINUX_SH),y)
	${CP} ${STAGING_TARGET_DIR}/lib/!m4/libgcc*.so* ${IDIR_LIBGCC}/$(ADK_TARGET_LIBC_PATH)
else
	${CP} ${STAGING_TARGET_DIR}/$(ADK_TARGET_LIBC_PATH)/libgcc*.so* ${IDIR_LIBGCC}/$(ADK_TARGET_LIBC_PATH)
endif
endif
ifeq ($(ADK_TARGET_MULTILIB_X86_32),y)
	${INSTALL_DIR} ${IDIR_LIBGCC}/lib32
	${CP} ${STAGING_TARGET_DIR_32}/lib/libgcc*.so* ${IDIR_LIBGCC}/lib32
endif
ifeq ($(ADK_TARGET_MULTILIB_X86_X32),y)
	${INSTALL_DIR} ${IDIR_LIBGCC}/libx32
	${CP} ${STAGING_TARGET_DIR_X32}/lib/libgcc*.so* ${IDIR_LIBGCC}/libx32
endif

include ${TOPDIR}/mk/pkg-bottom.mk
