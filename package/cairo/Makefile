# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cairo
PKG_VERSION:=		1.10.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		f101a9e88b783337b20b2e26dfd26d5f
PKG_DESCR:=		cairo graphics library
PKG_SECTION:=		libs
PKG_DEPENDS:=		fontconfig libfreetype libpng libx11 pixman
PKG_BUILDDEP:=		libpng pixman freetype fontconfig libX11
PKG_URL:=		http://cairographics.org/
PKG_SITES:=		http://cairographics.org/releases/

PKG_SUBPKGS:=		CAIRO CAIRO_DEV
PKGSC_CAIRO_DEV:=	devel
PKGSD_CAIRO_DEV:=	cairo headers

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CAIRO,cairo,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,CAIRO_DEV,cairo-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_CAIRO_DEV},${PKGSC_CAIRO_DEV},${PKG_OPTS}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ARGS+=	--enable-ft=yes \
			--enable-tee=yes \
			--enable-xlib=yes

cairo-install:
	${INSTALL_DIR} ${IDIR_CAIRO}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcairo.so* ${IDIR_CAIRO}/usr/lib

cairo-dev-install:
	${INSTALL_DIR} ${IDIR_CAIRO_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_CAIRO_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_CAIRO_DEV}/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc ${IDIR_CAIRO_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
