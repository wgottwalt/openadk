# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libowfat
PKG_VERSION:=		0.29
PKG_RELEASE:=		1
PKG_HASH:=		4badbdeed6bef4337f1edd6b86fb7154c5592509c272dcdc09c693161cbc6427
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.fefe.de/libowfat
PKG_SITES:=		http://dl.fefe.de/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

CONFIG_STYLE:=		manual

TARGET_CFLAGS+=		${TARGET_CPPFLAGS}
MAKE_FILE=		GNUmakefile
MAKE_FLAGS+=		DIET= CC='${TARGET_CC}' CROSS=${TARGET_CROSS} \
			LDFLAGS='${TARGET_LDFLAGS}'
FAKE_FLAGS+=		prefix='${WRKINST}/usr' \
			INCLUDEDIR='${WRKINST}/usr/include/owfat'

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
