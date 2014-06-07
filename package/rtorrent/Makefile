# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rtorrent
PKG_VERSION:=		0.9.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		fd9490a2ac67d0fa2a567c6267845876
PKG_DESCR:=		console torrent application
PKG_SECTION:=		app/p2p
PKG_DEPENDS:=		libncurses libtorrent libcurl libstdcxx
PKG_BUILDDEP:=		autotool ncurses libtorrent curl
PKG_URL:=		http://libtorrent.rakshasa.no/
PKG_SITES:=		http://libtorrent.rakshasa.no/downloads/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

AUTOTOOL_STYLE:=	autoreconf
TARGET_LDFLAGS+=	-lpthread -ltinfo

$(eval $(call PKG_template,RTORRENT,rtorrent,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

rtorrent-install:
	${INSTALL_DIR} ${IDIR_RTORRENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/rtorrent ${IDIR_RTORRENT}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
