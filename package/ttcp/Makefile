# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ttcp
PKG_VERSION:=		3.8
PKG_RELEASE:=		1
NO_DISTFILES:=		1

WRKDIST=		${WRKDIR}/ttcp

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TTCP,ttcp,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

do-build:
	${TARGET_CC} ${TCFLAGS} -o ${WRKBUILD}/ttcp ttcp.c

do-install:
	${INSTALL_DIR} ${IDIR_TTCP}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/ttcp ${IDIR_TTCP}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
