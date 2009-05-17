# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gmp
PKG_VERSION:=		4.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		7ce52531644e6d12f16911b7e3151f3f
MASTER_SITES:=		${MASTER_SITE_GNU:=gmp/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGMP,libgmp,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBGMP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgmp.so.* ${IDIR_LIBGMP}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
