# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		parprouted
PKG_VERSION:=		0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		570f5deaf09600df8f80f589de79ecdb
PKG_DESCR:=		a proxy ARP daemon
PKG_SECTION:=		net
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.hazard.maks.net/parprouted
PKG_SITES:=		http://www.hazard.maks.net/parprouted/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PARPROUTED,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC="${TARGET_CC}" \
			CFLAGS="${TCFLAGS}" \
			LDFLAGS=""

do-install:
	${INSTALL_DIR} ${IDIR_PARPROUTED}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/parprouted ${IDIR_PARPROUTED}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
