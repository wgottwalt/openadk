# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		alix-switch
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		simple daemon listening on button events
PKG_SECTION:=		base

PKG_TARGET_DEPENDS:=	alix

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ALIX_SWITCH,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

PKGDFLT_ALIX_SWITCH=	y

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} -Wall ${TCPPFLAGS} ${TCFLAGS} \
		-o ${WRKBUILD}/alix-switchd ${WRKBUILD}/alix-switchd.c

do-install:
	${INSTALL_DIR} ${IDIR_ALIX_SWITCH}/usr/sbin ${IDIR_ALIX_SWITCH}/etc
	${INSTALL_BIN} ${WRKBUILD}/alix-switchd ${IDIR_ALIX_SWITCH}/usr/sbin
	${INSTALL_BIN} ./files/alix-switch ${IDIR_ALIX_SWITCH}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
