# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		swconfig
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libnl
PKG_DESCR:=		switch configuration utility
PKG_SECTION:=		misc

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SWCONFIG,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS:=		LIBS="-lnl -lm" CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_DIR)/include"
BUILD_STYLE:=		auto

do-configure:
	mkdir -p ${WRKBUILD}
	${CP} ./src/* ${WRKBUILD}

do-install:
	${INSTALL_DIR} ${IDIR_SWCONFIG}/sbin
	${INSTALL_BIN} ${WRKBUILD}/swconfig ${IDIR_SWCONFIG}/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
