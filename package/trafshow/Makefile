# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		trafshow
PKG_VERSION:=		4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		0b2f0bb23b7832138b7d841437b9e182
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz
PKG_SITES:=		ftp://ftp.nsk.su/pub/RinetSoftware/
WRKDIST=		${WRKDIR}/trafshow-5.2.3

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TRAFSHOW,trafshow,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-DHAVE_SOCKADDR_STORAGE -DHAVE_HAS_COLORS -I$(STAGING_DIR)/usr/include
TLDFLAGS+=		-pthread
CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
ALL_TARGET=		

do-install:
	${INSTALL_DIR} ${IDIR_TRAFSHOW}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/trafshow ${IDIR_TRAFSHOW}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
