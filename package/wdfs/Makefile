# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		wdfs
PKG_VERSION=		1.4.2
PKG_RELEASE=		2
PKG_MD5SUM=		628bb44194d04c1cf8aacc446ed0a230
MASTER_SITES=		http://noedler.de/projekte/wdfs/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WDFS,wdfs,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_WDFS}/usr/bin
	${CP} ${WRKINST}/usr/bin/wdfs ${IDIR_WDFS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
