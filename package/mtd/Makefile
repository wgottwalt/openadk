# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mtd
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		MTD utility
PKG_SECTION:=		base

PKG_TARGET_DEPENDS:=	ag241 foxboard

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MTD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	mkdir -p ${WRKBUILD}
	${CP} ./src/* ${WRKBUILD}
	${TARGET_CC} ${TCPPFLAGS} ${TCFLAGS} -o ${WRKBUILD}/mtd \
		${WRKBUILD}/mtd.c

do-install:
	${INSTALL_DIR} ${IDIR_MTD}/sbin
	${INSTALL_BIN} ${WRKBUILD}/mtd ${IDIR_MTD}/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
