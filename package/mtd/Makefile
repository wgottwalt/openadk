# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mtd
PKG_VERSION:=		1.0
PKG_RELEASE:=		2
PKG_DESCR:=		flash utility
PKG_SECTION:=		sys/fs

PKG_DFLT_MTD:=		y if ADK_TARGET_WITH_MTD
PKG_CFLINE_MTD:=	depends on ADK_TARGET_WITH_MTD

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MTD,mtd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/mtd ${WRKBUILD}/mtd.c

do-install:
	${INSTALL_DIR} ${IDIR_MTD}/sbin
	${INSTALL_BIN} ${WRKBUILD}/mtd ${IDIR_MTD}/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
