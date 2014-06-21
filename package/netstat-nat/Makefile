# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		netstat-nat
PKG_VERSION:=		1.4.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		45e8d0f47623f619c22a6b894cd03cbc
PKG_DESCR:=		netstat variant for nat connections
PKG_SECTION:=		net/firewall
PKG_URL:=		http://www.tweegy.nl/projects/netstat-nat/index.html
PKG_SITES:=		http://www.tweegy.nl/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NETSTAT_NAT,netstat-nat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

netstat-nat-install:
	${INSTALL_DIR} ${IDIR_NETSTAT_NAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/netstat-nat \
		${IDIR_NETSTAT_NAT}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
