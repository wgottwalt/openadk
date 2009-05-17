# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		swconfig
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SWCONFIG,swconfig,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

#XAKE_FLAGS:=		LIBS="$(STAGING_DIR)/usr/lib/libnl.a -lm"
XAKE_FLAGS:=		LIBS="-lnl -lm" CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_DIR)/include"
BUILD_STYLE:=		auto

do-configure:
	mkdir -p ${WRKBUILD}
	${CP} ./src/* ${WRKBUILD}

do-install:
	${INSTALL_DIR} ${IDIR_SWCONFIG}/sbin
	${INSTALL_BIN} ${WRKBUILD}/swconfig ${IDIR_SWCONFIG}/sbin/swconfig

include ${TOPDIR}/mk/pkg-bottom.mk
