# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tinc
PKG_VERSION:=		1.0.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		ee0b1a3366c6e379cae34be6fa5dcb15
PKG_DESCR:=		VPN tunnel daemon
PKG_SECTION:=		net/security
PKG_DEPENDS:=		zlib liblzo libopenssl kmod-tun
PKG_BUILDDEP:=		zlib liblzo openssl
PKG_URL:=		http://www.tinc-vpn.org/
PKG_SITES:=		http://www.tinc-vpn.org/packages/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TINC,tinc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-kernel=${LINUX_DIR} \
			--with-zlib=${STAGING_TARGET_DIR}/usr/ \
			--with-lzo-include=${STAGING_TARGET_DIR}/usr/include/lzo

tinc-install:
	${INSTALL_DIR} ${IDIR_TINC}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tincd ${IDIR_TINC}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
