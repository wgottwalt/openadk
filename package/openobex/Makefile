# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openobex
PKG_VERSION:=		1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		feaa5dfe5151c0e70e8f868fa4648a43

MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=openobex/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENOBEX,openobex,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	PKG_CONFIG=""
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_OPENOBEX}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopenobex.so* ${IDIR_OPENOBEX}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
