# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libao
PKG_VERSION:=		0.8.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		b92cba3cbcf1ee9bc221118a85d23dcd
PKG_DESCR:=		A cross platform audio library
PKG_SECTION:=		libs
PKG_URL:=		http://www.xiph.org/ao
PKG_SITES:=		http://downloads.xiph.org/releases/ao/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBAO,libao,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

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
