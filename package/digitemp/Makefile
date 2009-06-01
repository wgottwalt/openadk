# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		digitemp
PKG_VERSION:=		3.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		0b6cfb36d198767836de54d9fb11bbdb
PKG_DESCR:=		simple to use program for reading values from 1-wire devices
PKG_SECTION:=		app
PKG_DEPENDS:=		libusb
PKG_URL:=		http://www.digitemp.com/software/linux
PKG_SITES:=		http://www.digitemp.com/software/linux/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DIGITEMP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ALL_TARGET=		ds2490
BUILD_STYLE=		auto

do-install:
	${INSTALL_DIR} ${IDIR_DIGITEMP}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/digitemp_DS2490 \
		${IDIR_DIGITEMP}/usr/sbin/digitemp_DS2490

include ${TOPDIR}/mk/pkg-bottom.mk
