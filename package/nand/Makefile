# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nand
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		NAND utility
PKG_SECTION:=		base

PKG_TARGET_DEPENDS:=	rb532

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NAND,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

PKGDFLT_NAND=		y

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	mkdir -p ${WRKBUILD}
	${CP} ./src/* ${WRKBUILD}
	${TARGET_CC} ${TCPPFLAGS} ${TCFLAGS} -o ${WRKBUILD}/nandwrite \
		${WRKBUILD}/nandwrite.c
	${TARGET_CC} ${TCPPFLAGS} ${TCFLAGS} -o ${WRKBUILD}/nanddump \
		${WRKBUILD}/nanddump.c

do-install:
	${INSTALL_DIR} ${IDIR_NAND}/sbin
	${INSTALL_BIN} ${WRKBUILD}/nandwrite ${IDIR_NAND}/sbin
	${INSTALL_BIN} ${WRKBUILD}/nanddump ${IDIR_NAND}/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
