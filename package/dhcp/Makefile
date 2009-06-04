# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dhcp
PKG_VERSION:=		4.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		1fffed2e8c3d67b111316d6a9b33db7a
PKG_DESCR:=		ISC DHCP server
PKG_SECTION:=		net
PKG_URL:=		https://www.isc.org/software/dhcp
PKG_SITES:=		ftp://ftp.isc.org/isc/dhcp/

PKG_DESCR_1:=		ISC DHCP relay server

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DHCP_SERVER,dhcp-server,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DHCP_RELAY,dhcp-relay,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_1},${PKG_SECTION}))

ifeq ($(ADK_IPV6),y)
CONFIGURE_ARGS+=       --enable-dhcpv6         
else
CONFIGURE_ARGS+=       --disable-dhcpv6                
endif

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_file__dev_random=yes
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_DHCP_RELAY}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dhcrelay ${IDIR_DHCP_RELAY}/usr/sbin/
	${INSTALL_DIR} ${IDIR_DHCP_SERVER}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dhcpd ${IDIR_DHCP_SERVER}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
