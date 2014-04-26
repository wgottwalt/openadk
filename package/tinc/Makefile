# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tinc
PKG_VERSION:=		1.0.23
PKG_RELEASE:=		1
PKG_MD5SUM:=		762c0d47bdf1b33a40b19165d9c2761f
PKG_DESCR:=		VPN tunnel daemon
PKG_SECTION:=		net/security
PKG_DEPENDS:=		zlib liblzo libopenssl kmod-tun
PKG_BUILDDEP:=		zlib liblzo openssl
PKG_URL:=		http://www.tinc-vpn.org/
PKG_SITES:=		http://www.tinc-vpn.org/packages/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TINC,tinc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-zlib=${STAGING_TARGET_DIR}/usr/ \
			--with-lzo-include=${STAGING_TARGET_DIR}/usr/include/lzo

tinc-install:
	${INSTALL_DIR} ${IDIR_TINC}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tincd ${IDIR_TINC}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
