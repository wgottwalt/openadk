# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		sdl-image
PKG_VERSION:=		1.2.12
PKG_RELEASE:=		1
PKG_HASH:=		0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699
PKG_DESCR:=		simple directmedia layer image library
PKG_SECTION:=		libs/image
PKG_DEPENDS:=		libpng libtiff libjpeg-turbo libsdl libstdcxx
PKG_BUILDDEP:=		libpng libtiff libjpeg-turbo sdl
HOST_BUILDDEP+=		libpng-host
PKG_URL:=		http://www.libsdl.org/
PKG_SITES:=		http://www.libsdl.org/projects/SDL_image/release/
PKG_LIBNAME:=		libsdl-image
PKG_OPTS:=		dev

DISTFILES:=             SDL_image-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/SDL_image-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBSDL_IMAGE,libsdl-image,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBSDL_IMAGE,libsdl-image,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

ifeq ($(ADK_HOST_DARWIN),y)
HOST_LDFLAGS+=		-framework Cocoa
endif

AUTOTOOL_STYLE:=	autogen
HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--with-sdl-prefix='${STAGING_HOST_DIR}/usr' \
			--disable-sdltest \
			--enable-png \
			--disable-webp \
			--disable-jpg \
			--disable-tif \
			--disable-bmp
CONFIGURE_ARGS+=	--with-sdl-prefix='${STAGING_TARGET_DIR}/usr' \
			--enable-png \
			--enable-jpg \
			--enable-bmp \
			--enable-tif \
			--disable-webp

libsdl-image-install:
	$(INSTALL_DIR) $(IDIR_LIBSDL_IMAGE)/usr/lib
	$(CP) ${WRKINST}/usr/lib/libSDL*.so* $(IDIR_LIBSDL_IMAGE)/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
