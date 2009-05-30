# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wpa_supplicant
PKG_VERSION:=		0.6.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		0efb8fcedf0a8acf6f423dfdb0658fdd
PKG_DESCR:=		WPA Supplicant with support for WPA and WPA2
PKG_SECTION:=		net
PKG_DEPENDS:=		libopenssl
PKG_SITES:=		http://hostap.epitest.fi/releases/

WRKSRC=			${WRKDIST}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WPA_SUPPLICANT,wpa-supplicant,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CPPFLAGS='${TCPPFLAGS}' \
			LDFLAGS='${TLDFLAGS}' \
			OPT_FLAGS='${TCFLAGS}' \
			KERNEL=${LINUX_DIR}

do-configure:
	${CP} files/config ${WRKBUILD}/.config

do-install:
	${INSTALL_DIR} ${IDIR_WPA_SUPPLICANT}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/wpa_cli ${IDIR_WPA_SUPPLICANT}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/wpa_passphrase ${IDIR_WPA_SUPPLICANT}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/wpa_supplicant ${IDIR_WPA_SUPPLICANT}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
