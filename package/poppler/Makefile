# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		poppler
PKG_VERSION:=		0.24.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		2da22b966cf7a2f8da5bf021e68188ce
PKG_DESCR:=		pdf rendering library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		fontconfig libstdcxx libpng cairo
PKG_DEPENDS:=		fontconfig libstdcxx libpng cairo
PKG_URL:=		http://poppler.freedesktop.org/
PKG_SITES:=		http://poppler.freedesktop.org/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,POPPLER,poppler,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

poppler-install:
	$(INSTALL_DIR) $(IDIR_POPPLER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpoppler*.so* \
		$(IDIR_POPPLER)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
