# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		flac
PKG_VERSION:=		1.3.0
PKG_RELEASE:=		1
PKG_HASH:=		fa2d64aac1f77e31dfbb270aeb08f5b32e27036a52ad15e69a77e309528010dc
PKG_DESCR:=		free lossless audio codec library
PKG_SECTION:=		libs/audio
PKG_URL:=		http://flac.sourceforge.net
PKG_SITES:=		http://downloads.xiph.org/releases/flac/
PKG_LIBNAME:=		libflac
PKG_OPTS:=		dev

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFLAC,libflac,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-asm-optimizations \
			--disable-xmms-plugin \
			--disable-cpplibs \
			--disable-ogg

libflac-install:
	${INSTALL_DIR} ${IDIR_LIBFLAC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libFLAC.so* ${IDIR_LIBFLAC}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
