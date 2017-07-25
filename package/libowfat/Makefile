# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libowfat
PKG_VERSION:=		0.30
PKG_RELEASE:=		1
PKG_HASH:=		db4a3a853cfbb9e83b27f565b580f6fdc519475b162edc1a656043e1c126e993
PKG_DESCR:=		owfat library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.fefe.de/libowfat
PKG_SITES:=		http://www.fefe.de/libowfat/

include ${ADK_TOPDIR}/mk/package.mk

CONFIG_STYLE:=		manual

TARGET_CFLAGS+=		${TARGET_CPPFLAGS}
MAKE_FILE=		GNUmakefile
MAKE_FLAGS+=		DIET= CC='${TARGET_CC}' CROSS=${TARGET_CROSS} \
			LDFLAGS='${TARGET_LDFLAGS}'
FAKE_FLAGS+=		prefix='${WRKINST}/usr' \
			INCLUDEDIR='${WRKINST}/usr/include/owfat'

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
