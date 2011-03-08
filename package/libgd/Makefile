# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gd
PKG_VERSION:=		2.0.35
PKG_RELEASE:=		2
PKG_MD5SUM:=		982963448dc36f20cb79b6e9ba6fdede
PKG_DESCR:=		A library for the dynamic creation of images
PKG_SECTION:=		libs
PKG_DEPENDS:=		libjpeg libpng
PKG_BUILDDEP:=		libpng jpeg
PKG_URL:=		http://www.libgd.org/
PKG_SITES:=		http://www.libgd.org/releases/

PKG_SUBPKGS:=		LIBGD LIBGD_DEV
PKGSC_LIBGD_DEV:=	devel
PKGSD_LIBGD_DEV:=	libgd headers

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGD,libgd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBGD_DEV,libgd-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBGD_DEV},${PKGSC_LIBGD_DEV}))

CONFIGURE_ENV+=		LIBPNG12_CONFIG="${STAGING_TARGET_DIR}/usr/bin/libpng12-config"
CONFIGURE_ARGS+=	--without-x \
			--without-freetype \
			--with-jpeg=${STAGING_TARGET_DIR}/usr \
			--with-png=${STAGING_TARGET_DIR}/usr \
			--without-xpm

libgd-install:
	${INSTALL_DIR} ${IDIR_LIBGD}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgd.so* ${IDIR_LIBGD}/usr/lib

libgd-dev-install:
	${INSTALL_DIR} ${IDIR_LIBGD_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBGD_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
