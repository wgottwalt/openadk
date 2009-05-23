# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libshout
PKG_VERSION:=		2.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		4f75fc9901c724b712c371c9a1e782d3
MASTER_SITES:=		http://downloads.us.xiph.org/releases/libshout/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSHOUT,libshout,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-speex=no \
			--with-theora=no
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBSHOUT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libshout.so.* ${IDIR_LIBSHOUT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
