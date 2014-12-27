# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libogg
PKG_VERSION:=		1.3.1
PKG_RELEASE:=		1
PKG_HASH:=		3a5bad78d81afb78908326d11761c0fb1a0662ee7150b6ad587cc586838cdcfa
PKG_DESCR:=		ogg bitstream handling library
PKG_SECTION:=		libs/audio
PKG_URL:=		http://www.xiph.org/ogg
PKG_SITES:=		http://downloads.xiph.org/releases/ogg/
PKG_OPTS:=		dev

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOGG,libogg,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libogg-install:
	${INSTALL_DIR} ${IDIR_LIBOGG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libogg.so* ${IDIR_LIBOGG}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
