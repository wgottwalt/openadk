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

PKG_SUBPKGS:=		LIBGD

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGD,libgd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		LIBPNG12_CONFIG="${STAGING_TARGET_DIR}/usr/bin/libpng12-config"
CONFIGURE_ARGS+=	--without-x \
			--without-freetype \
			--with-jpeg=${STAGING_TARGET_DIR}/usr \
			--with-png=${STAGING_TARGET_DIR}/usr \
			--without-xpm

post-install:
	${INSTALL_DIR} ${IDIR_LIBGD}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgd.so* ${IDIR_LIBGD}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
