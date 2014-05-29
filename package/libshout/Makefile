# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libshout
PKG_VERSION:=		2.3.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		11765b2592e7ea623ccd93d3f8df172c
PKG_DESCR:=		library which can be used to write a source client for streaming
PKG_SECTION:=		libs/audio
PKG_DEPENDS:=		libvorbis libogg
PKG_BUILDDEP:=		libvorbis
PKG_URL:=		http://directory.fsf.org/project/libshout
PKG_SITES:=		http://downloads.us.xiph.org/releases/libshout/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSHOUT,libshout,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-speex \
			--disable-theora

libshout-install:
	${INSTALL_DIR} ${IDIR_LIBSHOUT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libshout.so* ${IDIR_LIBSHOUT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
