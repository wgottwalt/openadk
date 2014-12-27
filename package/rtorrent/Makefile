# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		rtorrent
PKG_VERSION:=		0.9.4
PKG_RELEASE:=		1
PKG_HASH:=		bc0a2c1ee613b68f37021beaf4e64a9252f91ed06f998c1e897897c354ce7e84
PKG_DESCR:=		console torrent application
PKG_SECTION:=		app/p2p
PKG_DEPENDS:=		libncurses libtorrent libcurl libstdcxx
PKG_BUILDDEP:=		ncurses libtorrent curl
PKG_URL:=		http://libtorrent.rakshasa.no/
PKG_SITES:=		http://libtorrent.rakshasa.no/downloads/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

AUTOTOOL_STYLE:=	autoreconf
TARGET_LDFLAGS+=	-lpthread -ltinfo

$(eval $(call PKG_template,RTORRENT,rtorrent,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

rtorrent-install:
	${INSTALL_DIR} ${IDIR_RTORRENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/rtorrent ${IDIR_RTORRENT}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
