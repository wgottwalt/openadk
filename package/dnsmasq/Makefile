# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dnsmasq
PKG_VERSION:=		2.67
PKG_RELEASE:=		1
PKG_MD5SUM:=		3560068c6cc644a01924fa089a70bb9c
PKG_DESCR:=		A lightweight DNS and DHCP server
PKG_SECTION:=		dns
PKG_URL:=		http://thekelleys.org.uk/dnsmasq/
PKG_SITES:=		http://thekelleys.org.uk/dnsmasq/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DNSMASQ,dnsmasq,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

post-install:
	${INSTALL_DIR} ${IDIR_DNSMASQ}/usr/sbin ${IDIR_DNSMASQ}/etc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dnsmasq ${IDIR_DNSMASQ}/usr/sbin
	${INSTALL_DATA} ./files/dnsmasq.conf ${IDIR_DNSMASQ}/etc/dnsmasq.conf

include ${TOPDIR}/mk/pkg-bottom.mk
