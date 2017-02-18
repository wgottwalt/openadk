# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		poppler
PKG_VERSION:=		0.52.0
PKG_RELEASE:=		1
PKG_HASH:=		528b661738839f9a25f6e580fcd2d5db007e0a1948580c6489f0062798ca1992
PKG_DESCR:=		pdf rendering library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		fontconfig libpng cairo
PKG_DEPENDS:=		fontconfig libpng cairo
PKG_NEEDS:=		c++
PKG_URL:=		http://poppler.freedesktop.org/
PKG_SITES:=		http://poppler.freedesktop.org/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,POPPLER,poppler,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

poppler-install:
	$(INSTALL_DIR) $(IDIR_POPPLER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpoppler*.so* \
		$(IDIR_POPPLER)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
