# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libgd
PKG_VERSION:=		2.1.0
PKG_RELEASE:=		2
PKG_HASH:=		fa6665dfe3d898019671293c84d77067a3d2ede50884dbcb6df899d508370e5a
PKG_DESCR:=		library for the dynamic creation of images
PKG_SECTION:=		libs/image
PKG_DEPENDS:=		libpng libjpeg-turbo
PKG_BUILDDEP:=		libpng libjpeg-turbo
PKG_URL:=		http://www.libgd.org/
PKG_SITES:=		https://bitbucket.org/libgd/gd-libgd/downloads/
PKG_LIBNAME:=		libgd
PKG_OPTS:=		dev

include ${ADK_TOPDIR}/mk/package.mk

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
