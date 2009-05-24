# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		portsentry
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		3ebd3618ba9abfea2525e236bd44cebd
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=sentrytools/}

WRKDIST=		${WRKDIR}/${PKG_NAME}_beta

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PORTSENTRY,portsentry,${PKG_VERSION}-${PKG_RELEASE}))

BUILD_STYLE:=		auto
ALL_TARGET:=		linux
MAKE_FLAGS+=		CC="${TARGET_CC}" CFLAGS="${TCFLAGS}"

do-install:
	${INSTALL_DIR} ${IDIR_PORTSENTRY}/usr/bin \
	               ${IDIR_PORTSENTRY}/etc
	${INSTALL_DATA} ${WRKBUILD}/${PKG_NAME}.conf ${IDIR_PORTSENTRY}/etc/
	${INSTALL_BIN} ${WRKBUILD}/${PKG_NAME} ${IDIR_PORTSENTRY}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
