# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		readline
PKG_VERSION:=		5.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		e39331f32ad14009b9ff49cc10c5e751
MASTER_SITES:=		${MASTER_SITE_GNU:=readline/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBREADLINE,libreadline,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+= 	--with-curses
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBREADLINE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libhistory.so.* ${IDIR_LIBREADLINE}/usr/lib/
	${CP} ${WRKINST}/usr/lib/libreadline.so.* ${IDIR_LIBREADLINE}/usr/lib/
	chmod u+w ${IDIR_LIBREADLINE}/usr/lib/*

include ${TOPDIR}/mk/pkg-bottom.mk
