# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		sdl-image
PKG_VERSION:=		1.2.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		6c06584b31559e2b59f2b982d0d1f628
PKG_DESCR:=		Simple DirectMedia Layer
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpng libtiff libjpeg libsdl
PKG_BUILDDEP:=		libpng libtiff jpeg sdl
PKG_URL:=		http://www.libsdl.org/
PKG_SITES:=		http://www.libsdl.org/projects/SDL_image/release/
PKG_NEED_CXX:=		1

PKG_SUBPKGS:=		LIBSDL_IMAGE LIBSDL_IMAGE_DEV
PKGSD_LIBSDL_IMAGE_DEV:=development files for sdlimage
PKGSC_LIBSDL_IMAGE_DEV:=devel

DISTFILES:=             SDL_image-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/SDL_image-${PKG_VERSION}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSDL_IMAGE,libsdl-image,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBSDL_IMAGE_DEV,libsdl-image-dev,$(PKG_VERSION)-${PKG_RELEASE},libsdl-image,${PKGSD_LIBSDL_IMAGE_DEV},${PKGSC_LIBSDL_IMAGE_DEV}))

CONFIGURE_ARGS+=	--enable-png \
			--enable-jpg \
			--enable-bmp \
			--enable-tif

libsdl-image-install:
	$(INSTALL_DIR) $(IDIR_LIBSDL_IMAGE)/usr/lib
	$(CP) ${WRKINST}/usr/lib/libSDL*.so* $(IDIR_LIBSDL_IMAGE)/usr/lib

libsdl-image-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBSDL_IMAGE_DEV)/usr/include/SDL
	$(CP) ${WRKINST}/usr/include/SDL/*.h \
		$(IDIR_LIBSDL_IMAGE_DEV)/usr/include/SDL
	$(INSTALL_DIR) $(IDIR_LIBSDL_IMAGE_DEV)/usr/lib/pkgconfig
	$(CP) $(WRKINST)/usr/lib/pkgconfig/*.pc \
		$(IDIR_LIBSDL_IMAGE_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
