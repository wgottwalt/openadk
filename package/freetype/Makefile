# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libfreetype
PKG_VERSION:=		2.1.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		ec1b903e4be5f073caa72458ea58c29c
DISTFILES:=		freetype-${PKG_VERSION}.tar.bz2
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=freetype/}
WRKDIST=		${WRKDIR}/freetype-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFREETYPE,libfreetype,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBFREETYPE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfreetype.so.* ${IDIR_LIBFREETYPE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
