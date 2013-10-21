# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libshout
PKG_VERSION:=		2.2.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		4f75fc9901c724b712c371c9a1e782d3
PKG_DESCR:=		Library which can be used to write a source client for streaming
PKG_SECTION:=		libs
PKG_DEPENDS:=		libvorbis libogg
PKG_BUILDDEP:=		libvorbis
PKG_URL:=		http://directory.fsf.org/project/libshout
PKG_SITES:=		http://downloads.us.xiph.org/releases/libshout/
PKG_OPTS:=		dev

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSHOUT,libshout,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--with-speex=no \
			--with-theora=no

libshout-install:
	${INSTALL_DIR} ${IDIR_LIBSHOUT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libshout.so* ${IDIR_LIBSHOUT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
