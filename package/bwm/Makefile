# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bwm
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		51021a036acb92d2bda0c0c0483f9552
PKG_DESCR:=		very tiny bandwidth monitor
PKG_SECTION:=		net/perf
PKG_SITES:=		http://ftp.debian.org/debian/pool/main/b/bwm/

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.orig.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}.orig

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BWM,bwm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} ${TARGET_CFLAGS} ${WRKBUILD}/bwm.c -o ${WRKBUILD}/bwm

do-install:
	${INSTALL_DIR} ${IDIR_BWM}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/bwm ${IDIR_BWM}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
