# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		hostapd
PKG_VERSION:=		0.6.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		83630d11fa66ade9091f1b304fccd74c
PKG_DESCR:=		an IEEE 802.11 AP, IEEE 802.1x/WPA/WPA2/EAP/RADIUS Authenticator
PKG_SECTION:=		net
PKG_DEPENDS:=		libnl libopenssl
PKG_BUILDDEP+=		libnl openssl
PKG_URL:=		http://hostap.epitest.fi
PKG_SITES:=		http://hostap.epitest.fi/releases/

WRKSRC=			${WRKDIST}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HOSTAPD,hostapd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,HOSTAPD_UTILS,hostapd-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

do-configure:
	${CP} ./files/hostapd.config ${WRKBUILD}/.config

do-install:
	${INSTALL_DIR} ${IDIR_HOSTAPD_UTILS}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/hostapd_cli ${IDIR_HOSTAPD_UTILS}/usr/sbin/
	${INSTALL_DIR} ${IDIR_HOSTAPD}/etc
	${INSTALL_DIR} ${IDIR_HOSTAPD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/hostapd ${IDIR_HOSTAPD}/usr/sbin/
	${INSTALL_DATA} ./files/hostapd.conf ${IDIR_HOSTAPD}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
