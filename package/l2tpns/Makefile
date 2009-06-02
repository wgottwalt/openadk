# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		l2tpns
PKG_VERSION:=		2.1.21
PKG_RELEASE:=		1
PKG_MD5SUM:=		385c58055723ebc6c38062acd2db9c2c
PKG_DESCR:=		A layer 2 tunneling protocol network server (LNS)
PKG_SECTION:=		net
PKG_URL:=		http://l2tpns.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=l2tpns/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,L2TPNS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_FLAGS=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_L2TPNS}/etc/l2tpns
	${CP} ${WRKINST}/etc/l2tpns/* ${IDIR_L2TPNS}/etc/l2tpns/
	${INSTALL_DIR} ${IDIR_L2TPNS}/usr/lib/l2tpns
	${CP} ${WRKINST}/usr/lib/l2tpns/* ${IDIR_L2TPNS}/usr/lib/l2tpns/
	${INSTALL_DIR} ${IDIR_L2TPNS}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/* ${IDIR_L2TPNS}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
