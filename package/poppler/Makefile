# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		poppler
PKG_VERSION:=		0.24.5
PKG_RELEASE:=		2
PKG_HASH:=		a2654910100c923c44e366242495e226db2798254f2fa2781138867348759f84
PKG_DESCR:=		pdf rendering library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		fontconfig libstdcxx libpng cairo
PKG_DEPENDS:=		fontconfig libstdcxx libpng cairo
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
