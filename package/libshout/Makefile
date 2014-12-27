# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libshout
PKG_VERSION:=		2.3.1
PKG_RELEASE:=		1
PKG_HASH:=		cf3c5f6b4a5e3fcfbe09fb7024aa88ad4099a9945f7cb037ec06bcee7a23926e
PKG_DESCR:=		library which can be used to write a source client for streaming
PKG_SECTION:=		libs/audio
PKG_DEPENDS:=		libvorbis libogg
PKG_BUILDDEP:=		libvorbis
PKG_URL:=		http://directory.fsf.org/project/libshout
PKG_SITES:=		http://downloads.us.xiph.org/releases/libshout/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSHOUT,libshout,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-speex \
			--disable-theora

libshout-install:
	${INSTALL_DIR} ${IDIR_LIBSHOUT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libshout.so* ${IDIR_LIBSHOUT}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
