# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		SDL_gfx
PKG_VERSION:=		2.0.22
PKG_RELEASE:=		2
PKG_MD5SUM:=		330f291f1f09a1bdf397c9b40d92ca41
PKG_DESCR:=		sdl graphic library
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libsdl
PKG_BUILDDEP:=		sdl
PKG_URL:=		http://www.ferzkopp.net/joomla/content/view/19/14/
PKG_SITES:=		http://www.ferzkopp.net/Software/SDL_gfx-2.0/
PKG_LIBNAME:=		libsdl-gfx
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSDL_GFX,libsdl-gfx,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-mmx

libsdl-gfx-install:
	$(INSTALL_DIR) $(IDIR_LIBSDL_GFX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libSDL_gfx.so* $(IDIR_LIBSDL_GFX)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
