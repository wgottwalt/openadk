# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libfreetype
PKG_VERSION:=		2.3.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		d76233108aca9c9606cdbd341562ad9a
PKG_DESCR:=		A free, high-quality and portable font engine
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_URL:=		http://www.freetype.org
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=freetype/}

DISTFILES:=		freetype-${PKG_VERSION}.tar.bz2
WRKDIST=		${WRKDIR}/freetype-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFREETYPE,libfreetype,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBFREETYPE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfreetype.so.* ${IDIR_LIBFREETYPE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
