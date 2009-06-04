# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libogg
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		eaf7dc6ebbff30975de7527a80831585
PKG_DESCR:=		The Ogg bitstream handling library
PKG_SECTION:=		libs
PKG_URL:=		http://www.xiph.org/ogg
PKG_SITES:=		http://downloads.xiph.org/releases/ogg/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOGG,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBOGG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libogg.so.* ${IDIR_LIBOGG}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
