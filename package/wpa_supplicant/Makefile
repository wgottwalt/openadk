# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wpa_supplicant
PKG_VERSION:=		0.7.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		0e2cb7e4c35667351d8b7ec28c783e6a
PKG_DESCR:=		WPA Supplicant with support for WPA and WPA2
PKG_SECTION:=		net
ifeq (${ADK_PACKAGE_WPA_SUPPLICANT_WITH_OPENSSL},y)
PKG_BUILDDEP+=		openssl
endif
ifeq (${ADK_PACKAGE_WPA_SUPPLICANT_WITH_GNUTLS},y)
PKG_BUILDDEP+=		gnutls
endif
PKG_SITES:=		http://hostap.epitest.fi/releases/

WRKSRC=			${WRKDIST}/${PKG_NAME}

PKG_CHOICES:=		WITH_OPENSSL WITH_GNUTLS
PKGCD_WITH_OPENSSL:=	use OpenSSL for crypto
PKGCS_WITH_OPENSSL:=	libopenssl
PKGCD_WITH_GNUTLS:=	use GnuTLS for crypto
PKGCS_WITH_GNUTLS:=	libgnutls

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WPA_SUPPLICANT,wpa-supplicant,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

MAKE_FLAGS+=		CPPFLAGS='${TCPPFLAGS}' \
			LDFLAGS='${TLDFLAGS}' \
			OPT_FLAGS='${TCFLAGS}' \
			KERNEL=${LINUX_DIR}

do-configure:
	${CP} files/config ${WRKBUILD}/.config
ifneq (${ADK_PACKAGE_WPA_SUPPLICANT_WITH_GNUTLS},)
	${SED} "s#openssl#gnutls#" ${WRKBUILD}/.config
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
