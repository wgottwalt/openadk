# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dhcp
PKG_VERSION:=		4.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		38a74c89d8913b9b5f33737047623c18
PKG_DESCR:=		dhcp server
PKG_SECTION:=		net/dns
PKG_URL:=		https://www.isc.org/software/dhcp/
PKG_SITES:=		ftp://ftp.isc.org/isc/dhcp/${PKG_VERSION}/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		DHCP_SERVER DHCP_RELAY
PKGSD_DHCP_RELAY:=	dhcp relay server

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DHCP_SERVER,dhcp-server,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DHCP_RELAY,dhcp-relay,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_DHCP_RELAY},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_file__dev_random=yes

dhcp-relay-install:
	${INSTALL_DIR} ${IDIR_DHCP_RELAY}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dhcrelay \
		${IDIR_DHCP_RELAY}/usr/sbin/

dhcp-server-install:
	${INSTALL_DIR} ${IDIR_DHCP_SERVER}/usr/sbin
	${INSTALL_DIR} ${IDIR_DHCP_SERVER}/etc
	${INSTALL_DATA} ./files/dhcpd.conf ${IDIR_DHCP_SERVER}/etc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dhcpd \
		${IDIR_DHCP_SERVER}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
