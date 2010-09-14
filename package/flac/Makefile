# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		flac
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		153c8b15a54da428d1f0fadc756c22c7
PKG_DESCR:=		Free Lossless Audio Codec library
PKG_SECTION:=		libs
PKG_URL:=		http://flac.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=flac/}

PKG_SUBPKGS:=		LIBFLAC

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFLAC,libflac,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-asm-optimizations \
			--disable-xmms-plugin \
			--disable-cpplibs \
			--disable-ogg

post-install:
	${INSTALL_DIR} ${IDIR_LIBFLAC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libFLAC.so* ${IDIR_LIBFLAC}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
