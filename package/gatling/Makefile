# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		gatling
PKG_VERSION=		0.10
PKG_RELEASE=		1
PKG_MD5SUM=		04e8434156d91657c77a8a038c5b27cf
PKG_DESCR:=		small non-forking webserver
PKG_SECTION:=		net
PKG_DEPENDS:=		libiconv
PKG_URL:=		http://www.fefe.de/gatling
PKG_SITES=		http://dl.fefe.de/

DISTFILES=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GATLING,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE=		auto
MAKE_FILE=		GNUmakefile
ALL_TARGET=		gatling
TCPPFLAGS+=		-I${STAGING_DIR}/usr/include/owfat
XAKE_FLAGS+=		CC='${TARGET_CC}' \
			CFLAGS='${TCPPFLAGS} ${TCFLAGS}' \
			ZLIB=0 DIET= prefix='${WRKINST}/usr'

do-install:
	${INSTALL_DIR} ${IDIR_GATLING}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/gatling ${IDIR_GATLING}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
