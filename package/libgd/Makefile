# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libgd
PKG_VERSION:=		2.1.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		03588159bf4faab9079849c8d709acc6
PKG_DESCR:=		A library for the dynamic creation of images
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpng libjpeg-turbo
PKG_BUILDDEP:=		libpng libjpeg-turbo
PKG_URL:=		http://www.libgd.org/
PKG_SITES:=		https://bitbucket.org/libgd/gd-libgd/downloads/
PKG_LIBNAME:=		libgd
PKG_OPTS:=		dev

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGD,libgd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--without-x \
			--without-freetype \
			--with-jpeg=${STAGING_TARGET_DIR}/usr \
			--with-png=${STAGING_TARGET_DIR}/usr \
			--without-tiff \
			--without-vpx \
			--without-xpm

libgd-install:
	${INSTALL_DIR} ${IDIR_LIBGD}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgd.so* ${IDIR_LIBGD}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
