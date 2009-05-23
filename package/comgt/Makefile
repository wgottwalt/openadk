# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		comgt
PKG_VERSION:=		0.32
PKG_RELEASE:=		1
PKG_MD5SUM:=		db2452680c3d953631299e331daf49ef
DISTFILES:=		${PKG_NAME}.${PKG_VERSION}.tgz
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=comgt/}
WRKDIST=		${WRKDIR}/${PKG_NAME}.${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,COMGT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

BUILD_STYLE=		auto
ALL_TARGET=		comgt

do-install:
	${INSTALL_DIR} ${IDIR_COMGT}/usr/bin
	${INSTALL_DIR} ${IDIR_COMGT}/etc/comgt
	${INSTALL_BIN} ${WRKBUILD}/comgt ${IDIR_COMGT}/usr/bin/comgt
	${INSTALL_DATA} ./files/dial.comgt ${IDIR_COMGT}/etc/comgt/dial.comgt

include ${TOPDIR}/mk/pkg-bottom.mk
