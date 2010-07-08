# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ctorrent
PKG_VERSION:=		dnh3.3.2
PKG_RELEASE:=		1
PKG_BUILDDEP+=		openssl
PKG_MD5SUM:=		59b23dd05ff70791cd6449effa7fc3b6
PKG_DESCR:=		console-based BitTorrent client
PKG_SECTION:=		p2p
PKG_URL:=		http://www.rahul.net/dholmes/ctorrent
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=dtorrent/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CTORRENT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_CTORRENT}/usr/bin
	${CP} ${WRKINST}/usr/bin/ctorrent ${IDIR_CTORRENT}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
