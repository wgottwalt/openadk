# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		ssltunnel
PKG_VERSION:=		1.16
PKG_RELEASE:=		1
PKG_HASH:=		e801ab170f364ba2997fb276d16eba1f75bffcc0fc5a1e97ff0b247bf63b0570
PKG_DESCR:=		ppp over ssl vpn tool
PKG_SECTION:=		net/security
PKG_DEPENDS:=		ppp
PKG_BUILDDEP:=		ppp
PKG_SITES:=		http://www.hsc.fr/ressources/outils/ssltunnel/download/

PKG_CHOICES_SSLTUNNEL:=	WITH_LIBRESSL WITH_OPENSSL
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl ca-certificates
PKGCD_WITH_OPENSSL:=	use openssl for crypto
PKGCB_WITH_OPENSSL:=	openssl
PKGCS_WITH_OPENSSL:=	libopenssl ca-certificates

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc-ng glibc

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SSLTUNNEL,ssltunnel,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		BUILD_CC="${TARGET_CC}"
XAKE_FLAGS+=		CCOPT="${TARGET_CFLAGS}" INCLS="-I. -I${STAGING_TARGET_DIR}/usr/include"

ssltunnel-install:
	${INSTALL_DIR} ${IDIR_SSLTUNNEL}/usr/bin
	${INSTALL_DIR} ${IDIR_SSLTUNNEL}/usr/sbin
	${INSTALL_DIR} ${IDIR_SSLTUNNEL}/usr/libexec
	${INSTALL_BIN} ${WRKINST}/usr/bin/pppclient \
		${IDIR_SSLTUNNEL}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pppwho \
		${IDIR_SSLTUNNEL}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/libexec/pppserver \
		${IDIR_SSLTUNNEL}/usr/libexec/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
