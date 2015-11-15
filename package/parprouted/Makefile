# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		parprouted
PKG_VERSION:=		0.7
PKG_RELEASE:=		1
PKG_HASH:=		d63643c95d4149a3d71112da5892f459433456bf0279bfa304625f109178defc
PKG_DESCR:=		proxy arp daemon
PKG_SECTION:=		net/misc
PKG_NEEDS:=		threads
PKG_URL:=		http://www.hazard.maks.net/parprouted/
PKG_SITES:=		http://www.hazard.maks.net/parprouted/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PARPROUTED,parprouted,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

MAKE_FLAGS+=		CC="${TARGET_CC}" \
			CFLAGS="${TARGET_CFLAGS}" \
			LDFLAGS="${TARGET_LDFLAGS}"

do-install:
	${INSTALL_DIR} ${IDIR_PARPROUTED}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/parprouted ${IDIR_PARPROUTED}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
