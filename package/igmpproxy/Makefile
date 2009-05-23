# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		igmpproxy
PKG_VERSION:=		0.1-beta2
PKG_RELEASE:=		1
PKG_MD5SUM:=		2a5a59480f44d4b14077a6b5319e9940
DISTFILES:=		${PKG_NAME}-src-${PKG_VERSION}.tar.gz
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=igmpproxy/}
WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IGMPPROXY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

do-build:
	${MAKE} CC="${TARGET_CC}" CFLAGS="${TARGET_CFLAGS}" -C ${WRKBUILD}/src

do-install:
	${INSTALL_DIR} ${IDIR_IGMPPROXY}/usr/sbin 
	${INSTALL_DIR} ${IDIR_IGMPPROXY}/etc
	${INSTALL_BIN} ${WRKBUILD}/src/${PKG_NAME} ${IDIR_IGMPPROXY}/usr/sbin/
	${INSTALL_DATA} ${WRKBUILD}/src/${PKG_NAME}.conf ${IDIR_IGMPPROXY}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
