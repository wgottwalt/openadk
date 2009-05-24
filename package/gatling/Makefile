# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		gatling
PKG_VERSION=		0.8
PKG_RELEASE=		1
PKG_MD5SUM=		75e04c0821622ac7c35236bb2a50c31c

MASTER_SITES=		http://dl.fefe.de/
DISTFILES=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GATLING,gatling,${PKG_VERSION}-${PKG_RELEASE}))

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
