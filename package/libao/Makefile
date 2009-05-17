# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libao
PKG_VERSION:=		0.8.6
PKG_RELEASE:=		2
PKG_MD5SUM:=		12e136a4c0995068ff134997c84421ed
MASTER_SITES:=		http://downloads.xiph.org/releases/ao/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBAO,libao,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-esd \
			--disable-arts \
			--disable-nas \
			--disable-polyp
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBAO}/usr/lib
	${CP} ${WRKINST}/usr/lib/libao.so.* ${IDIR_LIBAO}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
