# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		expat
PKG_VERSION:=		1.95.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		aff487543845a82fe262e6e2922b4c8e

MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=expat/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBEXPAT,libexpat,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBEXPAT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libexpat.so.* ${IDIR_LIBEXPAT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
