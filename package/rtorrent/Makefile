# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rtorrent
PKG_VERSION:=		0.9.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		9bc258d7a63dd13e3348f310ae26a434
PKG_DESCR:=		console torrent application
PKG_SECTION:=		p2p
PKG_DEPENDS:=		libncurses libtorrent libcurl libstdcxx
PKG_BUILDDEP:=		ncurses libtorrent curl
PKG_URL:=		http://libtorrent.rakshasa.no/
PKG_SITES:=		http://libtorrent.rakshasa.no/downloads/

PKG_ARCH_DEPENDS:=	!avr32

include ${TOPDIR}/mk/package.mk

TARGET_LDFLAGS+=	-lpthread

$(eval $(call PKG_template,RTORRENT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

rtorrent-install:
	${INSTALL_DIR} ${IDIR_RTORRENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/rtorrent ${IDIR_RTORRENT}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
