# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libpng
PKG_VERSION:=		1.2.35
PKG_RELEASE:=		1
PKG_MD5SUM:=		8ca6246930a57d5be7adc7c4e7fb5e00
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=libpng/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPNG,libpng,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBPNG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpng{,12}.so.* ${IDIR_LIBPNG}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
