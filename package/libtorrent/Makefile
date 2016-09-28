# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libtorrent
PKG_VERSION:=		0.13.6
PKG_RELEASE:=		1
PKG_HASH:=		2838a08c96edfd936aff8fbf99ecbb930c2bfca3337dd1482eb5fccdb80d5a04
PKG_DESCR:=		bittorrent library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libsigc++ zlib libressl
PKG_BUILDDEP:=		libsigc++ zlib libressl gettext-tiny
PKG_URL:=		https://rakshasa.github.io/rtorrent/
PKG_SITES:=		http://rtorrent.net/downloads/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTORRENT,libtorrent,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--enable-aligned \
			--without-kqueue \
			--disable-instrumentation \
			--with-zlib=$(STAGING_TARGET_DIR)

libtorrent-install:
	${INSTALL_DIR} ${IDIR_LIBTORRENT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtorrent.so* ${IDIR_LIBTORRENT}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
