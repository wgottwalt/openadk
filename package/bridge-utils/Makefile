# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bridge-utils
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		9b7dc52656f5cbec846a7ba3299f73bd
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=bridge/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BRIDGE_UTILS,bridge-utils,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-linux-headers=${LINUX_DIR}
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_BRIDGE_UTILS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/brctl ${IDIR_BRIDGE_UTILS}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
