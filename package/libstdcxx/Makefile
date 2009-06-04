# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/glibc/Makefile.inc

PKG_NAME:=		libstdcxx
PKG_DESCR:=		C++ support library
PKG_SECTION:=		libs
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSTDCXX,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

do-install:
	${INSTALL_DIR} ${IDIR_LIBSTDCXX}/lib
	$(CP) ${STAGING_DIR}/lib/libstdc++.so.* ${IDIR_LIBSTDCXX}/lib

include ${TOPDIR}/mk/pkg-bottom.mk
