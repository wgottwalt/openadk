# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		poppler
PKG_VERSION:=		0.24.5
PKG_RELEASE:=		2
PKG_MD5SUM:=		334f2ac95cc8039f2a57fe63e4a81c69
PKG_DESCR:=		pdf rendering library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		fontconfig libstdcxx libpng cairo
PKG_DEPENDS:=		fontconfig libstdcxx libpng cairo
PKG_URL:=		http://poppler.freedesktop.org/
PKG_SITES:=		http://poppler.freedesktop.org/
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,POPPLER,poppler,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

poppler-install:
	$(INSTALL_DIR) $(IDIR_POPPLER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpoppler*.so* \
		$(IDIR_POPPLER)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
