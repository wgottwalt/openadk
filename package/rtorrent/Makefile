# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rtorrent
PKG_VERSION:=		0.8.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		a2456182e1767e5aed7341dbbd058f60
MASTER_SITES:=		http://libtorrent.rakshasa.no/downloads/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RTORRENT,rtorrent,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	autotool gnu
CONFIGURE_ARGS+=	--enable-aligned
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_RTORRENT}/usr/bin
	${CP} ${WRKINST}/usr/bin/* ${IDIR_RTORRENT}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
