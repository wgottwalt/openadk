# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		opus
PKG_VERSION:=		1.1.5
PKG_RELEASE:=		1
PKG_HASH:=		eb84981ca0f40a3e5d5e58d2e8582cb2fee05a022825a6dfe14d14b04eb563e4
PKG_DESCR:=		open, royalty-free, highly versatile audio codec
PKG_SECTION:=		libs/audio
PKG_URL:=		http://opus-codec.org/
PKG_SITES:=		https://archive.mozilla.org/pub/opus/
PKG_LIBNAME:=		libopus
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBOPUS,libopus,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CFLAGS:=		$(filter-out -ffast-math,$(TARGET_CFLAGS))

libopus-install:
	$(INSTALL_DIR) $(IDIR_LIBOPUS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libopus*.so* \
		$(IDIR_LIBOPUS)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
