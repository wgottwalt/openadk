# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tinc
PKG_VERSION:=		1.0.11
PKG_RELEASE:=		1
PKG_BUILDDEP+=		zlib openssl liblzo
PKG_MD5SUM:=		ee0b1a3366c6e379cae34be6fa5dcb15
PKG_DESCR:=		VPN tunnel daemon
PKG_SECTION:=		net
PKG_DEPENDS:=		zlib liblzo libopenssl kmod-tun
PKG_URL:=		http://www.tinc-vpn.org
PKG_SITES:=		http://www.tinc-vpn.org/packages/ \
			http://ftp.yi.se/pub/tinc/ \
			http://www.mirrors.wiretapped.net/security/network-security/tinc/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TINC,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-kernel=${LINUX_DIR} \
			--with-zlib=${STAGING_DIR}/usr/ \
			--with-lzo-include=${STAGING_DIR}/usr/include/lzo
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_TINC}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tincd ${IDIR_TINC}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
