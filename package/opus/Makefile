# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		opus
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		1
PKG_HASH:=		58b6fe802e7e30182e95d0cde890c0ace40b6f125cffc50635f0ad2eef69b633
PKG_DESCR:=		open, royalty-free, highly versatile audio codec
PKG_SECTION:=		libs/audio
PKG_URL:=		http://opus-codec.org/
PKG_SITES:=		http://downloads.xiph.org/releases/opus/
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
