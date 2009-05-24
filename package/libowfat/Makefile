# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		libowfat
PKG_VERSION=		0.25
PKG_RELEASE=		1
PKG_MD5SUM=		7a5ab9f5b7099b82e428cd308d170005

MASTER_SITES=		http://dl.fefe.de/
DISTFILES=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOWFAT,libowfat,${PKG_VERSION}-${PKG_RELEASE}))

BUILD_STYLE=		auto
INSTALL_STYLE=		auto
MAKE_FILE=		GNUmakefile
MAKE_FLAGS+=		DIET= CC='${TARGET_CC}' CROSS=${TARGET_CROSS}
TCFLAGS+=		${TCPPFLAGS}
FAKE_FLAGS+=		prefix='${WRKINST}/usr' \
			INCLUDEDIR='${WRKINST}/usr/include/owfat'

include ${TOPDIR}/mk/pkg-bottom.mk
