# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vtun
PKG_VERSION:=		3.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		c342ffe77055d4248a38f0b380f28c1b
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=vtun/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VTUN,vtun,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-ssl-headers=$(STAGING_DIR)/usr/include/openssl \
			--disable-lzo
#CONFIGURE_ENV+=		LIBS="${TLDFLAGS}" \
#			BLOWFISH_HDR_DIR="${STAGING_DIR}/usr/include/openssl" \
#			LZO_HDR_DIR="${STAGING_DIR}/usr/include/lzo" \
#			SSL_HDR_DIR="${STAGING_DIR}/usr/include/openssl"
BUILD_STYLE:=		auto
ALL_TARGET:=		vtund

do-install:
	${INSTALL_DIR} ${IDIR_VTUN}/etc/
	${INSTALL_DATA} ${WRKBUILD}/vtund.conf ${IDIR_VTUN}/etc/
	${INSTALL_DIR} ${IDIR_VTUN}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/vtund ${IDIR_VTUN}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
