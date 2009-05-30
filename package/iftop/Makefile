# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iftop
PKG_VERSION:=		0.17
PKG_RELEASE:=		1
PKG_MD5SUM:=		062bc8fb3856580319857326e0b8752d
PKG_DESCR:=		display bandwith usage on an interface
PKG_SECTION:=		net
PKG_DEPENDS:=		libncurses libpcap libpthread
PKG_URL:=		http://www.ex-parrot.com/~pdw/iftop
PKG_SITES:=		http://www.ex-parrot.com/~pdw/iftop/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IFTOP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

pots-install:
	${INSTALL_DIR} ${IDIR_IFTOP}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/${PKG_NAME} ${IDIR_IFTOP}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
