# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dhcp-forwarder
PKG_VERSION:=		0.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		3b96dd27f6d05502d4048acab453808d
PKG_DESCR:=		dhcp relay agent
PKG_SECTION:=		net/dns
PKG_URL:=		http://www.nongnu.org/dhcp-fwd/
PKG_SITES:=		http://savannah.nongnu.org/download/dhcp-fwd/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DHCP_FORWARDER,dhcp-forwarder,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-dietlibc
XAKE_FLAGS+=		cfg_filename="/etc/dhcp-fwd.conf"

post-install:
	${INSTALL_DIR} ${IDIR_DHCP_FORWARDER}/usr/sbin \
		${IDIR_DHCP_FORWARDER}/etc
	${INSTALL_DATA} ${WRKBUILD}/contrib/dhcp-fwd.conf \
		${IDIR_DHCP_FORWARDER}/etc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dhcp-fwd \
		${IDIR_DHCP_FORWARDER}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
