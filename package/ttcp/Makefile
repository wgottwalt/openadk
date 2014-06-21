# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		ttcp
PKG_VERSION:=		3.8
PKG_RELEASE:=		1
PKG_DESCR:=		small utility to test tcp connection performance
PKG_SECTION:=		net/perf

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TTCP,ttcp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/ttcp ${WRKBUILD}/ttcp.c

do-install:
	${INSTALL_DIR} ${IDIR_TTCP}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/ttcp ${IDIR_TTCP}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
