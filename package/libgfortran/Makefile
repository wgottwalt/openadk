# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk
include ${ADK_TOPDIR}/toolchain/gcc/Makefile.inc

PKG_NAME:=		libgfortran
PKG_DESCR:=		gcc fortran library
PKG_SECTION:=		base/libs
PKG_OPTS:=		noremove

PKG_CFLINE_LIBGCC:=	depends on ADK_TOOLCHAIN_WITH_FORTRAN

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGFORTRAN,libgfortran,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

libgfortran-install:
	$(INSTALL_DIR) ${IDIR_LIBGFORTRAN}/$(ADK_TARGET_LIBC_PATH)
ifeq ($(ADK_TARGET_USE_STATIC_LIBS_ONLY),)
ifeq ($(ADK_TARGET_BINFMT_FLAT),)
	${CP} ${STAGING_TARGET_DIR}/usr/lib/libgfortran.so* ${IDIR_LIBGFORTRAN}/$(ADK_TARGET_LIBC_PATH)
endif
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
