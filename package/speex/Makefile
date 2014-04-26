# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		speex
PKG_VERSION:=		1.2rc1
PKG_RELEASE:=		3
PKG_MD5SUM:=		c4438b22c08e5811ff10e2b06ee9b9ae
PKG_DESCR:=		open source patent-free speech compression codec
PKG_SECTION:=		libs
PKG_BUILDDEP:=		autotool
PKG_URL:=		http://speex.org/
PKG_SITES:=		http://downloads.us.xiph.org/releases/speex/
PKG_LIBNAME:=		libspeex
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSPEEX,libspeex,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--without-ogg --disable-oggtest --enable-fixed-point
XAKE_FLAGS+=		bin_PROGRAMS=""

libspeex-install:
	${INSTALL_DIR} ${IDIR_LIBSPEEX}/usr/lib
	${CP} ${WRKINST}/usr/lib/libspeex*.so* ${IDIR_LIBSPEEX}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
