# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		rdate
PKG_VERSION=		20070817
PKG_RELEASE=		2
PKG_MD5SUM=		9a6489d7de4311678a3fab001bb503df
MASTER_SITES=		${MASTER_SITE_MIRBSD:distfiles/=dist/mir/rdate/}
WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RDATE,rdate,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

MAKE_FILE=		GNUmakefile
BUILD_STYLE=		auto

do-install:
ifeq (${ADK_MANPAGES},y)
	mkdir -p ${WRKINST}/man8
	cp ${WRKSRC}/rdate.8 ${WRKINST}/man8/
endif
	${INSTALL_DIR} ${IDIR_RDATE}/{etc/{init.d,ppp/ip-up.d},usr/sbin}
	${INSTALL_BIN} ${WRKBUILD}/rdate ${IDIR_RDATE}/usr/sbin/
	${INSTALL_SCRIPT} rdate.ip-up ${IDIR_RDATE}/etc/ppp/ip-up.d/rdate
	${INSTALL_SCRIPT} rdate.init ${IDIR_RDATE}/etc/init.d/rdate

include ${TOPDIR}/mk/pkg-bottom.mk
