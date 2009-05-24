# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/glibc/Makefile.inc

PKG_NAME:=		libstdcxx
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSTDCXX,libstdcxx,${PKG_VERSION}-${PKG_RELEASE}))

do-install:
	${INSTALL_DIR} ${IDIR_LIBSTDCXX}/lib
	$(CP) ${STAGING_DIR}/lib/libstdc++.so.* ${IDIR_LIBSTDCXX}/lib

include ${TOPDIR}/mk/pkg-bottom.mk
