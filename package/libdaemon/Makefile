# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libdaemon
PKG_VERSION:=		0.10
PKG_RELEASE:=		2
PKG_MD5SUM:=		6812a5e4063b5016f25e9a0cebbd3dd9
MASTER_SITES:=		http://0pointer.de/lennart/projects/libdaemon/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBDAEMON,libdaemon,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes
CONFIGURE_ARGS+=	--disable-lynx
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBDAEMON}/usr/lib
	${CP} ${WRKINST}/usr/lib/libdaemon.so.* ${IDIR_LIBDAEMON}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
