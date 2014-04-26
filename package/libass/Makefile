# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libass
PKG_VERSION:=		0.10.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		0f54b1f3a24fa897ebbbcc5bc744b32a
PKG_DESCR:=		a portable subtitle renderer for the ASS/SSA format
PKG_SECTION:=		libs
PKG_DEPENDS:=		fribidi fontconfig
PKG_BUILDDEP:=		fribidi fontconfig
PKG_URL:=		http://code.google.com/p/libass/
PKG_SITES:=		http://libass.googlecode.com/files/
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBASS,libass,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libass-install:
	$(INSTALL_DIR) $(IDIR_LIBASS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libass*.so* \
		$(IDIR_LIBASS)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
