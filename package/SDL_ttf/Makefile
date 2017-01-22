# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		SDL_ttf
PKG_VERSION:=		2.0.10
PKG_RELEASE:=		2
PKG_HASH:=		7d38704bcc7c34029c2dcb73b2d4857e8ad76341c6e0faed279eb9f743c66c6a
PKG_DESCR:=		truetype fonts for sdl applications
PKG_SECTION:=		libs/fonts
PKG_DEPENDS:=		libsdl libfreetype
PKG_BUILDDEP:=		sdl freetype
PKG_NEEDS:=		intl
PKG_URL:=		http://www.libsdl.org/projects/SDL_ttf/
PKG_SITES:=		http://www.libsdl.org/projects/SDL_ttf/release/
PKG_LIBNAME:=		libsdl-ttf
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSDL_TTF,libsdl-ttf,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libsdl-ttf-install:
	$(INSTALL_DIR) $(IDIR_LIBSDL_TTF)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libSDL_ttf*so* $(IDIR_LIBSDL_TTF)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
