# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk
include ${ADK_TOPDIR}/toolchain/gcc/Makefile.inc

PKG_NAME:=		libgo
PKG_DESCR:=		gcc go library
PKG_SECTION:=		base/libs
PKG_DEPENDS:=		libpthread
PKG_OPTS:=		noremove

PKG_CFLINE_LIBGO:=	depends on ADK_TOOLCHAIN_WITH_GO

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGO,libgo,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

libgo-install:
	$(INSTALL_DIR) ${IDIR_LIBGO}/$(ADK_TARGET_LIBC_PATH)
ifeq ($(ADK_TARGET_USE_STATIC_LIBS_ONLY),)
ifeq ($(ADK_TARGET_BINFMT_FLAT),)
	${CP} ${STAGING_TARGET_DIR}/usr/lib/libgo.so* ${IDIR_LIBGO}/$(ADK_TARGET_LIBC_PATH)
endif
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
