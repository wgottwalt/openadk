# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		SDL_gfx
PKG_VERSION:=		2.0.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		330f291f1f09a1bdf397c9b40d92ca41
PKG_DESCR:=		SDL GFX library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libsdl
PKG_BUILDDEP:=		sdl
PKG_URL:=		http://www.ferzkopp.net/joomla/content/view/19/14/
PKG_SITES:=		http://www.ferzkopp.net/Software/SDL_gfx-2.0/

PKG_SUBPKGS:=		LIBSDL_GFX LIBSDL_GFX_DEV
PKGSD_LIBSDL_GFX_DEV:=	development files for SDL_gfx
PKGSC_LIBSDL_GFX_DEV:=	devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSDL_GFX,libsdl-gfx,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBSDL_GFX_DEV,libsdl-gfx-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBSDL_GFX_DEV},${PKGSC_LIBSDL_GFX_DEV}))

CONFIGURE_ARGS+=	--disable-mmx

libsdl-gfx-install:
	$(INSTALL_DIR) $(IDIR_LIBSDL_GFX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libSDL_gfx.so* $(IDIR_LIBSDL_GFX)/usr/lib

libsdl-gfx-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBSDL_GFX_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* $(IDIR_LIBSDL_GFX_DEV)/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
