# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ssltunnel
PKG_VERSION:=		1.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		4039b50566a33a4077883ea974e476d5
PKG_DESCR:=		ppp over ssl vpn tool
PKG_SECTION:=		net/security
PKG_DEPENDS:=		libopenssl ppp
PKG_BUILDDEP:=		openssl ppp
PKG_SITES:=		http://www.hsc.fr/ressources/outils/ssltunnel/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc glibc

include ${TOPDIR}/mk/package.mk

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

include ${TOPDIR}/mk/pkg-bottom.mk
