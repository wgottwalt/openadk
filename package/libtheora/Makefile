# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libtheora
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		292ab65cedd5021d6b7ddd117e07cd8e
PKG_DESCR:=		Theora video codec
PKG_SECTION:=		libs
PKG_DEPENDS:=		libsdl libogg libvorbis
PKG_BUILDDEP:=		sdl libogg libvorbis
PKG_URL:=		http://www.theora.org/
PKG_SITES:=		http://downloads.xiph.org/releases/theora/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBTHEORA,libtheora,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-examples

libtheora-install:
	$(INSTALL_DIR) $(IDIR_LIBTHEORA)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libtheora*.so* \
		$(IDIR_LIBTHEORA)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
