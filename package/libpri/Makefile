# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libpri
PKG_VERSION:=		1.2.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		b9354f420304afa7b8923615a117b9c6
MASTER_SITES:=		http://www.asterisk-support.de/mirror/libpri/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPRI,libpri,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC='${TARGET_CC}'
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBPRI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpri.so.* ${IDIR_LIBPRI}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
