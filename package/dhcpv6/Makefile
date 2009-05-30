# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dhcpv6
PKG_VERSION:=		1.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		d537416b33002f56912b7f27477d8d35
PKG_DESCR:=		Dynamic Host Configuration Protocol for IPv6 (DHCPv6) server
PKG_SECTION:=		net
PKG_DEPENDS:=		libncurses libnl
PKG_URL:=		https://fedorahosted.org/dhcpv6
PKG_SITES:=		https://fedorahosted.org/releases/d/h/dhcpv6/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DHCPV6_SERVER,dhcpv6-server,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	autoconf gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_DHCP6_SERVER}/usr/sbin 

include ${TOPDIR}/mk/pkg-bottom.mk
