# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tiff
PKG_VERSION:=		3.9.4
PKG_RELEASE:=		3
PKG_MD5SUM:=		2006c1bdd12644dbf02956955175afd6
PKG_DESCR:=		A library for reading/writing TIFF images
PKG_SECTION:=		libs
PKG_URL:=		http://www.libtiff.org/
PKG_SITES:=		ftp://ftp.remotesensing.org/pub/libtiff/
PKG_NEED_CXX:=		1

PKG_SUBPKGS:=		LIBTIFF LIBTIFF_DEV
PKGSD_LIBTIFF_DEV:=	development files for libtiff
PKGSC_LIBTIFF_DEV:=	devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTIFF,libtiff,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBTIFF_DEV,libtiff-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBTIFF_DEV},${PKGSC_LIBTIFF_DEV},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-cxx \
			--disable-rpath

post-install:
	${INSTALL_DIR} ${IDIR_LIBTIFF}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtiff.so* ${IDIR_LIBTIFF}/usr/lib/

libtiff-dev-install:
	${INSTALL_DIR} ${IDIR_LIBTIFF_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_LIBTIFF_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
