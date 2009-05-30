# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		srelay
PKG_VERSION:=		0.4.6
PKG_RELEASE:=		9
PKG_MD5SUM:=		4a9f3298b38d8588f0ffde31b946a47f
PKG_DESCR:=		A socks 4/5 proxy server
PKG_SECTION:=		net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=socks-relay/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SRELAY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-thread
BUILD_STYLE:=		auto

do-install:
	${INSTALL_DIR} ${IDIR_SRELAY}/usr/bin ${IDIR_SRELAY}/etc
	${INSTALL_BIN} ${WRKBUILD}/srelay ${IDIR_SRELAY}/usr/bin/
	${INSTALL_DATA} ./files/srelay.conf ${IDIR_SRELAY}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
