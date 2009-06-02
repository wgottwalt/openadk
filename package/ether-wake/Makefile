# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ether-wake
PKG_VERSION:=		1.09
PKG_RELEASE:=		1
PKG_DESCR:=		A Wake-On-LAN (WOL) client
PKG_SECTION:=		net

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ETHER_WAKE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

do-build:
	${TARGET_CC} ${TARGET_CFLAGS} -o ${WRKBUILD}/${PKG_NAME} ${WRKBUILD}/${PKG_NAME}.c

do-install:
	${INSTALL_DIR} ${IDIR_ETHER_WAKE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/${PKG_NAME} ${IDIR_ETHER_WAKE}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
