# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gatling
PKG_VERSION:=		0.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		a0fb49ccb6b910bdbd7e76a9960394e3
PKG_DESCR:=		small non-forking webserver
PKG_SECTION:=		net
PKG_DEPENDS:=		libiconv
PKG_BUILDDEP+=		libowfat libiconv
PKG_URL:=		http://www.fefe.de/gatling/
PKG_SITES:=		http://dl.fefe.de/

DISTFILES=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GATLING,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

MAKE_FILE:=		GNUmakefile
ALL_TARGET:=		gatling
TCPPFLAGS+=		-I${STAGING_DIR}/usr/include/owfat
XAKE_FLAGS+=		CC='${TARGET_CC}' \
			CFLAGS='${TCPPFLAGS} ${TCFLAGS}' \
			ZLIB=0 DIET= prefix='${WRKINST}/usr'

do-install:
	${INSTALL_DIR} ${IDIR_GATLING}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/gatling ${IDIR_GATLING}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
