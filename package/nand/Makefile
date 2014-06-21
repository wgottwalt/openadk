# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		nand
PKG_VERSION:=		1.0
PKG_RELEASE:=		3
PKG_DESCR:=		nand flash utility
PKG_SECTION:=		sys/fs

PKG_DFLT_NAND:=		y if ADK_TARGET_WITH_NAND
PKG_CFLINE_NAND:=	depends on ADK_TARGET_WITH_NAND

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NAND,nand,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/nand ${WRKBUILD}/nand.c

do-install:
	${INSTALL_DIR} ${IDIR_NAND}/sbin
	${INSTALL_BIN} ${WRKBUILD}/nand ${IDIR_NAND}/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
