# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libtorrent
PKG_VERSION:=		0.13.4
PKG_RELEASE:=		2
PKG_HASH:=		704e097119dc89e2ee4630396b25de1cd64b0549841347ea75b9ef9217084955
PKG_DESCR:=		bittorrent library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libopenssl libsigc++
PKG_BUILDDEP:=		openssl libsigc++ gettext-tiny
PKG_URL:=		http://libtorrent.rakshasa.no/
PKG_SITES:=		http://distfiles.openadk.org/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTORRENT,libtorrent,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--enable-aligned \
			--without-kqueue \
			--disable-instrumentation

libtorrent-install:
	${INSTALL_DIR} ${IDIR_LIBTORRENT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtorrent.so* ${IDIR_LIBTORRENT}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
