# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		less
PKG_VERSION:=		381
PKG_RELEASE:=		1
PKG_MD5SUM:=		40c2dd4ac137b61b6a55a6478817daf4
MASTER_SITES:=		http://www.greenwoodsoftware.com/less/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LESS,less,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--without-regex
BUILD_STYLE=		auto

do-install:
	${INSTALL_DIR} ${IDIR_LESS}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/less ${IDIR_LESS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
