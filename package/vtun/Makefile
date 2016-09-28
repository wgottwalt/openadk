# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		vtun
PKG_VERSION:=		3.0.1
PKG_RELEASE:=		1
PKG_HASH:=		22507499a8f650ef97157977e62fa632d5b0034070629a2d0fd0512e304eaeeb
PKG_DESCR:=		vpn tunnel daemon
PKG_SECTION:=		net/security
PKG_DEPENDS:=		zlib liblzo libressl
PKG_BUILDDEP:=		zlib liblzo libressl
PKG_KDEPENDS:=		tun
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=vtun/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_HOST_DEPENDS:=	!freebsd

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VTUN,vtun,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual

CONFIGURE_ARGS+=	--with-ssl-headers=$(STAGING_TARGET_DIR)/usr/include/openssl \
			--disable-lzo
ALL_TARGET:=		vtund

do-install:
	${INSTALL_DIR} ${IDIR_VTUN}/usr/sbin ${IDIR_VTUN}/etc
	${INSTALL_DATA} ${WRKBUILD}/vtund.conf ${IDIR_VTUN}/etc/
	${INSTALL_BIN} ${WRKBUILD}/vtund ${IDIR_VTUN}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
