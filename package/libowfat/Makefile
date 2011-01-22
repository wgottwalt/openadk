# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libowfat
PKG_VERSION:=		0.28
PKG_RELEASE:=		1
PKG_MD5SUM:=		6bbee9a86506419657d87123b7a6f2c1
PKG_URL:=		http://www.fefe.de/libowfat
PKG_SITES:=		http://dl.fefe.de/
PKG_SUBPKGS:=

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

CONFIG_STYLE:=		manual

TARGET_CFLAGS+=		${TARGET_CPPFLAGS}
MAKE_FILE=		GNUmakefile
MAKE_FLAGS+=		DIET= CC='${TARGET_CC}' CROSS=${TARGET_CROSS} \
			LDFLAGS='${TARGET_LDFLAGS}'
FAKE_FLAGS+=		prefix='${WRKINST}/usr' \
			INCLUDEDIR='${WRKINST}/usr/include/owfat'

include ${TOPDIR}/mk/pkg-bottom.mk
