# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtool
PKG_VERSION:=		2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		b32b04148ecdd7344abc6fe8bd1bb021
PKG_DESCR:=		a generic dynamic object loading library
PKG_SECTION:=		lang
PKG_URL:=		http://www.gnu.org/software/libtool/
PKG_SITES:=		${MASTER_SITE_GNU:=libtool/}

PKG_SUBPKGS:=		LIBTOOL LIBLTDL LIBLTDL_DEV
PKGSC_LIBLTDL:=		libs
PKGSD_LIBLTDL_DEV:=	libltdl header files
PKGSC_LIBLTDL_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTOOL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBLTDL,libltdl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKGSC_LIBLTDL}))
$(eval $(call PKG_template,LIBLTDL_DEV,libltdl-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKGSC_LIBLTDL_DEV}))

ifeq (${ADK_HOST_OPENBSD},y)
XAKE_FLAGS+=		AUTOCONF_VERSION=2.62
endif

CONFIGURE_ARGS+=	--enable-ltdl-install

post-install:
	${INSTALL_DIR} ${IDIR_LIBTOOL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/libtool ${IDIR_LIBTOOL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/libtoolize ${IDIR_LIBTOOL}/usr/bin

libltdl-install:
	${INSTALL_DIR} ${IDIR_LIBLTDL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libltdl.so* ${IDIR_LIBLTDL}/usr/lib/

libltdl-dev-install:
	${INSTALL_DIR} ${IDIR_LIBLTDL_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBLTDL_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
