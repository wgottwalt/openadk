# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		rdate
PKG_VERSION=		20070817
PKG_RELEASE=		2
PKG_MD5SUM=		9a6489d7de4311678a3fab001bb503df
PKG_DESCR:=		A small rdate and NTP client
PKG_SECTION:=		net
PKG_SITES=		${MASTER_SITE_MIRBSD:distfiles/=dist/mir/rdate/}

WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RDATE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_FILE=		GNUmakefile
BUILD_STYLE=		auto

do-install:
	${INSTALL_DIR} ${IDIR_RDATE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/rdate ${IDIR_RDATE}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
