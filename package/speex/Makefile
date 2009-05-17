# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		speex
PKG_VERSION:=		1.2rc1
PKG_RELEASE:=		1
PKG_MD5SUM:=		c4438b22c08e5811ff10e2b06ee9b9ae
MASTER_SITES:=		http://downloads.us.xiph.org/releases/speex/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSPEEX,libspeex,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-ogg --disable-oggtest --enable-fixed-point
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
XAKE_FLAGS+=		bin_PROGRAMS=""

post-install:
	${INSTALL_DIR} ${IDIR_LIBSPEEX}/usr/lib
	${CP} ${WRKINST}/usr/lib/libspeex.so.* ${IDIR_LIBSPEEX}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
