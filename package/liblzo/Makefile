# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		lzo
PKG_VERSION:=		2.03
PKG_RELEASE:=		1
PKG_MD5SUM:=		0c3d078c2e8ea5a88971089a2f02a726
PKG_DESCR:=		a real-time data compression library
PKG_SECTION:=		libs
PKG_URL:=		http://www.oberhumer.com/opensource/lzo
PKG_SITES:=		http://www.oberhumer.com/opensource/lzo/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBLZO,liblzo,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--enable-static
BUILD_STYLE:=		auto
MAKE_FLAGS+=		CFLAGS_O="${TARGET_CFLAGS}"
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBLZO}/usr/lib/
	${CP} ${WRKINST}/usr/lib/liblzo2.so.* ${IDIR_LIBLZO}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
