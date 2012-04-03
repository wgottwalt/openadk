# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		hostapd
# git version from 03.04.2012
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		2a93bb1ecfcdf23a9d7db1f272e5e764
PKG_DESCR:=		an IEEE 802.11 AP, IEEE 802.1x/WPA/WPA2/EAP/RADIUS Authenticator
PKG_SECTION:=		wifi
PKG_DEPENDS:=		libnl
PKG_BUILDDEP:=		libnl
PKG_URL:=		http://hostap.epitest.fi/
PKG_SITES:=		http://hostap.epitest.fi/releases/
PKG_MULTI:=		1

PKG_SUBPKGS:=		HOSTAPD HOSTAPD_UTILS
PKG_CHOICES_HOSTAPD:=	WITH_OPENSSL WITH_GNUTLS
PKGCD_WITH_OPENSSL:=	use OpenSSL for crypto
PKGCS_WITH_OPENSSL:=	libopenssl
PKGCB_WITH_OPENSSL:=	openssl
PKGCD_WITH_GNUTLS:=	use GnuTLS for crypto
PKGCS_WITH_GNUTLS:=	libgnutls
PKGCB_WITH_GNUTLS:=	gnutls

WRKSRC=			${WRKDIST}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HOSTAPD,hostapd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,HOSTAPD_UTILS,hostapd-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_CFLAGS+=		-I$(STAGING_DIR)/usr/include/libnl3

do-configure:
	${CP} ./files/hostapd.config ${WRKBUILD}/.config
ifneq (${ADK_PACKAGE_HOSTAPD_WITH_GNUTLS},)
	${SED} "s#openssl#gnutls#" ${WRKBUILD}/.config
endif

do-install:
	${INSTALL_DIR} ${IDIR_HOSTAPD_UTILS}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/hostapd_cli ${IDIR_HOSTAPD_UTILS}/usr/sbin/
	${INSTALL_DIR} ${IDIR_HOSTAPD}/etc
	${INSTALL_DIR} ${IDIR_HOSTAPD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/hostapd ${IDIR_HOSTAPD}/usr/sbin/
	${INSTALL_DATA} ./files/hostapd.conf ${IDIR_HOSTAPD}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
