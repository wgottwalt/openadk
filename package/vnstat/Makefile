# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vnstat
PKG_VERSION:=		1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		9184f79b5e60499bc059f670032291e5

MASTER_SITES:=		http://humdi.net/vnstat/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VNSTAT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		${TARGET_CONFIGURE_OPTS}
ALL_TARGET:=		vnstat

do-install:
	${INSTALL_DIR} ${IDIR_VNSTAT}/usr/bin/
	${INSTALL_BIN} ${WRKBUILD}/src/vnstat ${IDIR_VNSTAT}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
