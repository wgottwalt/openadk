# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dhcp
PKG_VERSION:=		3.0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		426bfa1712ababaff4be6dadee9c1982
PKG_DESCR:=		ISC DHCP server
PKG_SECTION:=		net
PKG_URL:=		https://www.isc.org/software/dhcp
PKG_SITES:=		ftp://ftp.isc.org/isc/dhcp/

PKG_DESCR_1:=		ISC DHCP relay server

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DHCP_SERVER,dhcp-server,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DHCP_RELAY,dhcp-relay,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_1},${PKG_SECTION}))

do-configure:
	(cd ${WRKBUILD} ; \
		./configure --copts "${TARGET_CFLAGS}" linux-2.2 \
	);

MAKE_FLAGS+=		RANLIB=${TARGET_CROSS}ranlib
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_DHCP_RELAY}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dhcrelay ${IDIR_DHCP_RELAY}/usr/sbin/
	${INSTALL_DIR} ${IDIR_DHCP_SERVER}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dhcpd ${IDIR_DHCP_SERVER}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
