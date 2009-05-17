# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		strongswan
PKG_VERSION:=		4.1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		8a9f0c0dd939eeb1f6b8d6cb86925ffa
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
MASTER_SITES:=		http://download.strongswan.org/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,STRONGSWAN,strongswan,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_STRONGSWAN}/etc/init.d
	${INSTALL_BIN} ./files/strongswan.init \
		${IDIR_STRONGSWAN}/etc/init.d/strongswan

include ${TOPDIR}/mk/pkg-bottom.mk
