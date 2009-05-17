# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libp11
PKG_VERSION:=		0.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		b8655b2065575eb1b96a9c924c234c63
MASTER_SITES:=		http://www.opensc-project.org/files/libp11/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBP11,libp11,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBP11}/usr/lib
	${CP} ${WRKINST}/usr/lib/libp11.so.* ${IDIR_LIBP11}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
