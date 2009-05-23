# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cgilib
PKG_VERSION:=		0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		2c7053f58dfb06f7a80a112797ed7e86
MASTER_SITES:=		http://www.infodrom.org/projects/cgilib/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CGILIB,cgilib,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_CGILIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcgi.so* ${IDIR_CGILIB}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
