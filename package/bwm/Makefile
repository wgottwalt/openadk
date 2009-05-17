# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bwm
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		51021a036acb92d2bda0c0c0483f9552
DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.orig.tar.gz
MASTER_SITES:=		http://ftp.debian.org/debian/pool/main/b/bwm/
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}.orig

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BWM,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

do-build:
	${TARGET_CC} ${TARGET_CFLAGS} ${WRKBUILD}/bwm.c -o ${WRKBUILD}/bwm

do-install:
	${INSTALL_DIR} ${IDIR_BWM}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/bwm ${IDIR_BWM}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
