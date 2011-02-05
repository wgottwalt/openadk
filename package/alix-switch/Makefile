# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		alix-switch
PKG_VERSION:=		1.0
PKG_RELEASE:=		4
PKG_DESCR:=		daemon listening on button events
PKG_SECTION:=		base
PKG_URL:=		http://openadk.org/

PKG_CFLINE_ALIX_SWITCH:=depends on (ADK_TARGET_SYSTEM_ALIX2D2 || ADK_TARGET_SYSTEM_ALIX2D13)
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ALIX_SWITCH,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_CFLAGS+=		-Wall

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/alix-switchd ${WRKBUILD}/alix-switchd.c

do-install:
	${INSTALL_DIR} ${IDIR_ALIX_SWITCH}/usr/sbin ${IDIR_ALIX_SWITCH}/etc
	${INSTALL_BIN} ${WRKBUILD}/alix-switchd ${IDIR_ALIX_SWITCH}/usr/sbin
	${INSTALL_BIN} ./files/alix-switch ${IDIR_ALIX_SWITCH}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
