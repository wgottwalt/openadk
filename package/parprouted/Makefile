# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		parprouted
PKG_VERSION:=		0.63
PKG_RELEASE:=		9
PKG_MD5SUM:=		12753098a22e82997d1941d6d2284750
MASTER_SITES:=		http://www.hazard.maks.net/parprouted/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PARPROUTED,parprouted,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC="${TARGET_CC}" \
			CFLAGS="${TCFLAGS}" \
			LDFLAGS=""

do-install:
	${INSTALL_DIR} ${IDIR_PARPROUTED}/etc/init.d
	${INSTALL_DIR} ${IDIR_PARPROUTED}/usr/sbin
	${INSTALL_BIN} ./files/parprouted.init \
		${IDIR_PARPROUTED}/etc/init.d/parprouted
	${INSTALL_BIN} ${WRKBUILD}/parprouted ${IDIR_PARPROUTED}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
