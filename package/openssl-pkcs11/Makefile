# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openssl-pkcs11
PKG_VERSION:=		0.1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		26eb84950a10b7d869e41a50620ebf09
DISTFILES:=		engine_pkcs11-${PKG_VERSION}.tar.gz
MASTER_SITES:=		http://www.opensc-project.org/files/engine_pkcs11/
WRKDIST=		${WRKDIR}/engine_pkcs11-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENSSL_PKCS11,openssl-pkcs11,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		cross_compiling=yes
CONFIGURE_ARGS+=	--with-openssl="${STAGING_DIR}/usr"
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_OPENSSL_PKCS11}/usr/lib/engines
	${INSTALL_DATA} ${WRKINST}/usr/lib/engines/engine_pkcs11.so \
		${IDIR_OPENSSL_PKCS11}/usr/lib/engines

include ${TOPDIR}/mk/pkg-bottom.mk
