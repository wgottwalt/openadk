# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libgdbm
PKG_VERSION:=		1.8.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		1d1b1d5c0245b1c00aff92da751e9aa1

MASTER_SITES:=		${MASTER_SITE_GNU:=gdbm/}
DISTFILES:=		gdbm-${PKG_VERSION}.tar.gz

WRKDIST=		${WRKDIR}/gdbm-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGDBM,libgdbm,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
XAKE_FLAGS+=		BINOWN=`id -u` \
			BINGRP=`id -g` \
			INSTALL_ROOT="${WRKINST}"

post-install:
	${INSTALL_DIR} ${IDIR_LIBGDBM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgdbm.so.* ${IDIR_LIBGDBM}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
