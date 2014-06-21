# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		l2tpns
PKG_VERSION:=		2.1.21
PKG_RELEASE:=		3
PKG_MD5SUM:=		385c58055723ebc6c38062acd2db9c2c
PKG_DESCR:=		layer 2 tunneling protocol network server
PKG_SECTION:=		net/security
PKG_DEPENDS:=		libcli
PKG_BUILDDEP:=		libcli
PKG_URL:=		http://l2tpns.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=l2tpns/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,L2TPNS,l2tpns,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

l2tpns-install:
	${INSTALL_DIR} ${IDIR_L2TPNS}/etc/l2tpns
	${CP} ${WRKINST}/etc/l2tpns/* ${IDIR_L2TPNS}/etc/l2tpns/
	${INSTALL_DIR} ${IDIR_L2TPNS}/usr/lib/l2tpns
	${CP} ${WRKINST}/usr/lib/l2tpns/* ${IDIR_L2TPNS}/usr/lib/l2tpns/
	${INSTALL_DIR} ${IDIR_L2TPNS}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/* ${IDIR_L2TPNS}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
