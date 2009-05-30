# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libpng
PKG_VERSION:=		1.2.36
PKG_RELEASE:=		1
PKG_MD5SUM:=		4779cd011409ea9b591e11638781f0bf
PKG_DESCR:=		A library for reading/writing PNG images
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_URL:=		http://www.libpng.org/pub/png/libpng.html
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libpng/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPNG,libpng,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBPNG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpng{,12}.so.* ${IDIR_LIBPNG}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
