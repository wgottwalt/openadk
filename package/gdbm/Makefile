# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gdbm
PKG_VERSION:=		1.8.3
PKG_RELEASE:=		3
PKG_MD5SUM:=		1d1b1d5c0245b1c00aff92da751e9aa1
PKG_DESCR:=		disk file format database
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnu.org/software/gdbm/
PKG_SITES:=		${MASTER_SITE_GNU:=gdbm/}
PKG_LIBNAME:=		libgdbm
PKG_OPTS:=		dev

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGDBM,libgdbm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

XAKE_FLAGS+=		BINOWN=`id -u` \
			BINGRP=`id -g` \
			INSTALL_ROOT="${WRKINST}"

libgdbm-install:
	${INSTALL_DIR} ${IDIR_LIBGDBM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgdbm.so* ${IDIR_LIBGDBM}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
