# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dhcp-forwarder
PKG_VERSION:=		0.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		fb3670dee9f71af1e55ac5dcd64e213e
PKG_DESCR:=		DHCP relay agent
PKG_SECTION:=		net
PKG_URL:=		http://www.nongnu.org/dhcp-fwd
PKG_SITES:=		http://savannah.nongnu.org/download/dhcp-fwd/ \
			http://ftp.cc.uoc.gr/mirrors/nongnu.org/dhcp-fwd/ 

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DHCP_FORWARDER,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-dietlibc
XAKE_FLAGS+=		cfg_filename="/etc/dhcp-fwd.conf"

post-install:
	${INSTALL_DIR} ${IDIR_DHCP_FORWARDER}/usr/sbin \
		${IDIR_DHCP_FORWARDER}/etc
	${INSTALL_DATA} ${WRKBUILD}/contrib/dhcp-fwd.conf \
		${IDIR_DHCP_FORWARDER}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dhcp-fwd \
		${IDIR_DHCP_FORWARDER}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
