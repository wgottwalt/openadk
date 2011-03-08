# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rtorrent
PKG_VERSION:=		0.8.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		b804c45c01c40312926bcea6b55bb084
PKG_DESCR:=		console torrent application
PKG_SECTION:=		p2p
PKG_DEPENDS:=		libncurses libtorrent libcurl
PKG_BUILDDEP:=		ncurses libtorrent curl
PKG_URL:=		http://libtorrent.rakshasa.no/
PKG_SITES:=		http://libtorrent.rakshasa.no/downloads/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RTORRENT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

rtorrent-install:
	${INSTALL_DIR} ${IDIR_RTORRENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/rtorrent ${IDIR_RTORRENT}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
