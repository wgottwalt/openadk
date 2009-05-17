# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		digitemp
PKG_VERSION:=		3.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		0b6cfb36d198767836de54d9fb11bbdb
MASTER_SITES:=		http://www.digitemp.com/software/linux/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DIGITEMP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

ALL_TARGET=		ds2490
BUILD_STYLE=		auto

do-install:
	${INSTALL_DIR} ${IDIR_DIGITEMP}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/digitemp_DS2490 \
		${IDIR_DIGITEMP}/usr/sbin/digitemp_DS2490

include ${TOPDIR}/mk/pkg-bottom.mk
