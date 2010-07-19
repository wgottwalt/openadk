# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nand
PKG_VERSION:=		1.0
PKG_RELEASE:=		3
PKG_DESCR:=		NAND utility
PKG_SECTION:=		fs

PKG_TARGET_DEPENDS:=	routerboard

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NAND,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

PKGDFLT_NAND=		y

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} -Wall ${TCPPFLAGS} ${TCFLAGS} -o ${WRKBUILD}/nand \
		${WRKBUILD}/nand.c

do-install:
	${INSTALL_DIR} ${IDIR_NAND}/sbin
	${INSTALL_BIN} ${WRKBUILD}/nand ${IDIR_NAND}/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
