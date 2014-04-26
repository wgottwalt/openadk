# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libogg
PKG_VERSION:=		1.3.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		ca25d8da0ddfc8c6cbbf78d847a209fe
PKG_DESCR:=		Ogg bitstream handling library
PKG_SECTION:=		libs
PKG_URL:=		http://www.xiph.org/ogg
PKG_SITES:=		http://downloads.xiph.org/releases/ogg/
PKG_OPTS:=		dev

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOGG,libogg,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libogg-install:
	${INSTALL_DIR} ${IDIR_LIBOGG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libogg.so* ${IDIR_LIBOGG}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
