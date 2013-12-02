# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		opus
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		86eedbd3c5a0171d2437850435e6edff
PKG_DESCR:=		open, royalty-free, highly versatile audio codec
PKG_SECTION:=		libs
PKG_URL:=		http://opus-codec.org/
PKG_SITES:=		http://downloads.xiph.org/releases/opus/
PKG_LIBNAME:=		libopus
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBOPUS,libopus,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libopus-install:
	$(INSTALL_DIR) $(IDIR_LIBOPUS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libopus*.so* \
		$(IDIR_LIBOPUS)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
