# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		sispmctl
PKG_VERSION:=		2.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		2457f76cd129f880634f3381be0aeb76
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=sispmctl/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SISPMCTL,sispmctl,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_SISPMCTL}/usr/bin
	${CP} ${WRKINST}/usr/bin/sispmctl ${IDIR_SISPMCTL}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
