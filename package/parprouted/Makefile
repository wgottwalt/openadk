# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		parprouted
PKG_VERSION:=		0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		570f5deaf09600df8f80f589de79ecdb
PKG_DESCR:=		a proxy ARP daemon
PKG_SECTION:=		proxy
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.hazard.maks.net/parprouted/
PKG_SITES:=		http://www.hazard.maks.net/parprouted/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PARPROUTED,parprouted,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

MAKE_FLAGS+=		CC="${TARGET_CC}" \
			CFLAGS="${TARGET_CFLAGS}" \
			LDFLAGS="${TARGET_LDFLAGS}"

do-install:
	${INSTALL_DIR} ${IDIR_PARPROUTED}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/parprouted ${IDIR_PARPROUTED}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
