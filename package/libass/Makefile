# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libass
PKG_VERSION:=		0.10.1
PKG_RELEASE:=		2
PKG_HASH:=		fbf287ac6d0dbdf015783b7354280ad8371c106326ad3f77a99471bc5aa18210
PKG_DESCR:=		portable subtitle renderer
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		fribidi fontconfig
PKG_BUILDDEP:=		fribidi fontconfig
PKG_URL:=		http://code.google.com/p/libass/
PKG_SITES:=		http://libass.googlecode.com/files/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBASS,libass,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libass-install:
	$(INSTALL_DIR) $(IDIR_LIBASS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libass*.so* \
		$(IDIR_LIBASS)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
