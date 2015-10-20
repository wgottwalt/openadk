# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		tinc
PKG_VERSION:=		1.0.23
PKG_RELEASE:=		1
PKG_HASH:=		bcf06bdf16ff903821e33fc1ce6219d6429971aa5acd70f4e8a35b4332442812
PKG_DESCR:=		vpn tunnel daemon
PKG_SECTION:=		net/security
PKG_DEPENDS:=		zlib liblzo
PKG_BUILDDEP:=		zlib liblzo
PKG_URL:=		http://www.tinc-vpn.org/
PKG_SITES:=		http://www.tinc-vpn.org/packages/
PKG_CFLINE_TINC:=	select ADK_KERNEL_TUN m

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CHOICES_TINC:=	WITH_LIBRESSL WITH_OPENSSL
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl
PKGCD_WITH_OPENSSL:=	use openssl for crypto
PKGCB_WITH_OPENSSL:=	openssl
PKGCS_WITH_OPENSSL:=	libopenssl

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TINC,tinc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-zlib=${STAGING_TARGET_DIR}/usr/ \
			--with-lzo-include=${STAGING_TARGET_DIR}/usr/include/lzo

tinc-install:
	${INSTALL_DIR} ${IDIR_TINC}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tincd ${IDIR_TINC}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
