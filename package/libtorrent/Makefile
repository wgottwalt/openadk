# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtorrent
PKG_VERSION:=		0.12.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		037499ed708aaf72988cee60e5a8d96b
PKG_DESCR:=		A bittorrent library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libopenssl libsigc++
PKG_BUILDDEP:=		openssl libsigc++
PKG_URL:=		http://libtorrent.rakshasa.no/
PKG_SITES:=		http://libtorrent.rakshasa.no/downloads/

PKG_ARCH_DEPENDS:=	!avr32

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTORRENT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-aligned

libtorrent-install:
	${INSTALL_DIR} ${IDIR_LIBTORRENT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtorrent.so* ${IDIR_LIBTORRENT}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
