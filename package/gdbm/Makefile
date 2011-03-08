# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gdbm
PKG_VERSION:=		1.8.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		1d1b1d5c0245b1c00aff92da751e9aa1
PKG_DESCR:=		disk file format database
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnu.org/software/gdbm/
PKG_SITES:=		${MASTER_SITE_GNU:=gdbm/}

PKG_SUBPKGS:=		LIBGDBM LIBGDBM_DEV
PKGSC_LIBGDBM_DEV:=	devel
PKGSD_LIBGDBM_DEV:=	libgdbm headers

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGDBM,libgdbm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBGDBM_DEV,libgdbm-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBGDBM_DEV},${PKGSC_LIBGDBM_DEV}))

XAKE_FLAGS+=		BINOWN=`id -u` \
			BINGRP=`id -g` \
			INSTALL_ROOT="${WRKINST}"

libgdbm-install:
	${INSTALL_DIR} ${IDIR_LIBGDBM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgdbm.so* ${IDIR_LIBGDBM}/usr/lib

libgdbm-dev-install:
	${INSTALL_DIR} ${IDIR_LIBGDBM_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_LIBGDBM_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
