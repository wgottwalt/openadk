# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libcli
PKG_VERSION:=		1.8.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		fde7103a3771f550bfd366ee3ca1ef53

MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=libcli/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBCLI,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBCLI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcli.so.* ${IDIR_LIBCLI}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
