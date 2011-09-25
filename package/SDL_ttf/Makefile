# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		SDL_ttf
PKG_VERSION:=		2.0.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		814e6e17e8879254208d23b3b7e0354b
PKG_DESCR:=		TrueType fonts in your SDL applications
PKG_SECTION:=		libs
PKG_DEPENDS:=		libsdl libfreetype
PKG_BUILDDEP:=		sdl freetype
PKG_URL:=		http://www.libsdl.org/projects/SDL_ttf/
PKG_SITES:=		http://www.libsdl.org/projects/SDL_ttf/release/

PKG_SUBPKGS:=		LIBSDL_TTF LIBSDL_TTF_DEV
PKGSD_LIBSDL_TTF_DEV:=	development files
PKGSC_LIBSDL_TTF_DEV:=	devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSDL_TTF,libsdl-ttf,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBSDL_TTF_DEV,libsdl-ttf-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBSDL_TTF_DEV},${PKGSC_LIBSDL_TTF_DEV}))

libsdl-ttf-install:
	$(INSTALL_DIR) $(IDIR_LIBSDL_TTF)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libSDL_ttf*so* $(IDIR_LIBSDL_TTF)/usr/lib

libsdl-ttf-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBSDL_TTF_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* $(IDIR_LIBSDL_TTF_DEV)/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
