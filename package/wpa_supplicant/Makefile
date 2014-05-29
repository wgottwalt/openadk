# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wpa_supplicant
PKG_VERSION:=		2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		3be2ebfdcced52e00eda0afe2889839d
PKG_DESCR:=		wpa supplicant
PKG_SECTION:=		net/wifi
PKG_DEPENDS:=		libnl
PKG_BUILDDEP:=		libnl
PKG_URL:=		http://hostap.epitest.fi/wpa_supplicant/
PKG_SITES:=		http://hostap.epitest.fi/releases/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_DFLT_WPA_SUPPLICANT:=	y if ADK_TARGET_SYSTEM_IBM_X40

WRKSRC=			${WRKDIST}/${PKG_NAME}

PKG_CHOICES_WPA_SUPPLICANT:=	WITH_GNUTLS WITH_OPENSSL WITH_INTERNAL
PKGCD_WITH_OPENSSL:=		use OpenSSL for crypto
PKGCS_WITH_OPENSSL:=		libopenssl
PKGCB_WITH_OPENSSL:=		openssl
PKGCD_WITH_GNUTLS:=		use GnuTLS for crypto
PKGCS_WITH_GNUTLS:=		libgnutls
PKGCB_WITH_GNUTLS:=		gnutls
PKGCD_WITH_INTERNAL:=		use internal crypto library

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WPA_SUPPLICANT,wpa-supplicant,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual
TARGET_CFLAGS+=		-I$(STAGING_TARGET_DIR)/usr/include/libnl3

MAKE_FLAGS+=		CPPFLAGS='${TARGET_CPPFLAGS}' \
			LDFLAGS='${TARGET_LDFLAGS}' \
			OPT_FLAGS='${TARGET_CFLAGS}' \
			KERNEL=${LINUX_DIR}

do-configure:
	${CP} ./files/config ${WRKBUILD}/.config
ifneq (${ADK_PACKAGE_WPA_SUPPLICANT_WITH_GNUTLS},)
	${SED} "s#openssl#gnutls#" ${WRKBUILD}/.config
endif
ifneq (${ADK_PACKAGE_WPA_SUPPLICANT_WITH_INTERNAL},)
	${SED} "s#openssl#internal#" ${WRKBUILD}/.config
endif

do-install:
	${INSTALL_DIR} ${IDIR_WPA_SUPPLICANT}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/wpa_cli \
		${IDIR_WPA_SUPPLICANT}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/wpa_passphrase \
		${IDIR_WPA_SUPPLICANT}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/wpa_supplicant \
		${IDIR_WPA_SUPPLICANT}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
