# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

ifeq ($(ADK_TARGET_LIB_GLIBC),y)
include ${ADK_TOPDIR}/toolchain/glibc/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC),y)
include ${ADK_TOPDIR}/toolchain/uclibc/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG),y)
include ${ADK_TOPDIR}/toolchain/uclibc-ng/Makefile.inc
endif

PKG_NAME:=		libgcc
PKG_DESCR:=		gcc library
PKG_SECTION:=		base/libs
PKG_OPTS:=		noremove

PKG_DFLT_LIBGCC:=	y if !(ADK_TOOLCHAIN_ONLY)
PKG_LIBC_DEPENDS:=	uclibc uclibc-ng glibc


NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGCC,libgcc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

libgcc-install:
	$(INSTALL_DIR) ${IDIR_LIBGCC}/$(ADK_TARGET_LIBC_PATH)
ifeq ($(ADK_LINUX_SH),y)
ifeq ($(ADK_TARGET_LIB_GLIBC),)
	${CP} ${STAGING_TARGET_DIR}/lib/m4-nofpu/libgcc*.so* ${IDIR_LIBGCC}/$(ADK_TARGET_LIBC_PATH)
endif
else
	${CP} ${STAGING_TARGET_DIR}/lib/libgcc*.so* ${IDIR_LIBGCC}/$(ADK_TARGET_LIBC_PATH)
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
