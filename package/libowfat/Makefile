# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libowfat
PKG_VERSION:=		0.28
PKG_RELEASE:=		1
PKG_MD5SUM:=		6bbee9a86506419657d87123b7a6f2c1
PKG_DESCR:=		useful C library
PKG_SECTION:=		libs
PKG_URL:=		http://www.fefe.de/libowfat
PKG_SITES:=		http://dl.fefe.de/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOWFAT,libowfat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE=		auto
INSTALL_STYLE=		auto
MAKE_FILE=		GNUmakefile
MAKE_FLAGS+=		DIET= CC='${TARGET_CC}' CROSS=${TARGET_CROSS}
TCFLAGS+=		${TCPPFLAGS}
FAKE_FLAGS+=		prefix='${WRKINST}/usr' \
			INCLUDEDIR='${WRKINST}/usr/include/owfat'

include ${TOPDIR}/mk/pkg-bottom.mk
