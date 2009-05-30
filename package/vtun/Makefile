# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vtun
PKG_VERSION:=		3.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		c342ffe77055d4248a38f0b380f28c1b
PKG_DESCR:=		A VPN tunnel daemon
PKG_SECTION:=		net
PKG_DEPENDS:=		libopenssl zlib kmod-tun
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=vtun/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VTUN,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-ssl-headers=$(STAGING_DIR)/usr/include/openssl \
			--disable-lzo
BUILD_STYLE:=		auto
ALL_TARGET:=		vtund

do-install:
	${INSTALL_DIR} ${IDIR_VTUN}/usr/sbin ${IDIR_VTUN}/etc
	${INSTALL_DATA} ${WRKBUILD}/vtund.conf ${IDIR_VTUN}/etc/
	${INSTALL_BIN} ${WRKBUILD}/vtund ${IDIR_VTUN}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
