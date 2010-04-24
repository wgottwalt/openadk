# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wpa_supplicant
PKG_VERSION:=		0.7.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		02c475f949e5c131856915bbb87fa55d
PKG_DESCR:=		WPA Supplicant with support for WPA and WPA2
PKG_SECTION:=		wifi
ifeq (${ADK_COMPILE_WPA_SUPPLICANT_WITH_OPENSSL},y)
PKG_DEPENDS:=		libopenssl
PKG_BUILDDEP+=		openssl
endif
PKG_SITES:=		http://hostap.epitest.fi/releases/

WRKSRC=			${WRKDIST}/${PKG_NAME}

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

do-install:
	${INSTALL_DIR} ${IDIR_WPA_SUPPLICANT}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/wpa_cli \
		${IDIR_WPA_SUPPLICANT}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/wpa_passphrase \
		${IDIR_WPA_SUPPLICANT}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/wpa_supplicant \
		${IDIR_WPA_SUPPLICANT}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
