# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		openssl-pkcs11
PKG_VERSION:=		0.1.8
PKG_RELEASE:=		1
PKG_HASH:=		de7d7e41e7c42deef40c53e10ccc3f88d2c036d6656ecee7e82e8be07b06a2e5
PKG_DESCR:=		pkcs11 engine for openssl
PKG_SECTION:=		app/crypto
PKG_BUILDDEP:=		libp11
PKG_URL:=		http://www.opensc-project.org/engine_pkcs11
PKG_SITES:=		http://www.opensc-project.org/files/engine_pkcs11/

DISTFILES:=		engine_pkcs11-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/engine_pkcs11-${PKG_VERSION}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENSSL_PKCS11,openssl-pkcs11,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-openssl="${STAGING_TARGET_DIR}/usr"

openssl-pkcs11-install:
	${INSTALL_DIR} ${IDIR_OPENSSL_PKCS11}/usr/lib/engines
	${INSTALL_DATA} ${WRKINST}/usr/lib/engines/engine_pkcs11.so \
		${IDIR_OPENSSL_PKCS11}/usr/lib/engines

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
