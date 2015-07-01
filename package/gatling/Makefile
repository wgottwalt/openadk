# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		gatling
PKG_VERSION:=		0.11
PKG_RELEASE:=		1
PKG_HASH:=		9e1cb18612905b63755b0f463e6c5268789b3ab47db364bebe1ad077583e7571
PKG_DESCR:=		small non-forking webserver
PKG_SECTION:=		net/http
PKG_BUILDDEP:=		libowfat
PKG_URL:=		http://www.fefe.de/gatling/
PKG_SITES:=		http://dl.fefe.de/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GATLING,gatling,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

MAKE_FILE:=		GNUmakefile
ALL_TARGET:=		gatling
TARGET_CPPFLAGS+=	-I${STAGING_TARGET_DIR}/usr/include/owfat
XAKE_FLAGS+=		CC='${TARGET_CC}' \
			CFLAGS='${TARGET_CPPFLAGS} ${TARGET_CFLAGS}' \
			ZLIB=0 DIET= prefix='${WRKINST}/usr'

do-install:
	${INSTALL_DIR} ${IDIR_GATLING}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/gatling ${IDIR_GATLING}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
