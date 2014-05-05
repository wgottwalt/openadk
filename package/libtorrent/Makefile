# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtorrent
PKG_VERSION:=		0.13.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		96c0b81501357df402ab592f59ecaeab
PKG_DESCR:=		bittorrent library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libopenssl libsigc++
PKG_BUILDDEP:=		openssl libsigc++ gettext-tiny
PKG_URL:=		http://libtorrent.rakshasa.no/
PKG_SITES:=		http://libtorrent.rakshasa.no/downloads/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTORRENT,libtorrent,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-aligned \
			--without-kqueue

libtorrent-install:
	${INSTALL_DIR} ${IDIR_LIBTORRENT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtorrent.so* ${IDIR_LIBTORRENT}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
