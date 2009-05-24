# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iptables-snmp
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		8370d2f0c899461a053da491400119d1
MASTER_SITES:=		http://www.nobiscuit.com/iptables-snmp/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPTABLES_SNMP,iptables-snmp,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
FAKE_FLAGS+=		INSTALL_PREFIX="${WRKINST}"

post-install:
	${INSTALL_DIR} ${IDIR_IPTABLES_SNMP}/usr/lib
	${CP} ${WRKINST}/usr/lib/iptables-snmp.so ${IDIR_IPTABLES_SNMP}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
