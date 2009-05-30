# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ttcp
PKG_VERSION:=		3.8
PKG_RELEASE:=		1
PKG_DESCR:=		A small utility to test TCP connection performance
PKG_SECTION:=		net

NO_DISTFILES:=		1
WRKDIST=		${WRKDIR}/ttcp

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TTCP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

do-build:
	${TARGET_CC} ${TARGET_CFLAGS} -o ${WRKBUILD}/ttcp ttcp.c

do-install:
	${INSTALL_DIR} ${IDIR_TTCP}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/ttcp ${IDIR_TTCP}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
