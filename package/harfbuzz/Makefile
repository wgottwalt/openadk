# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		harfbuzz
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		2
PKG_HASH:=		f616a7fbdc78a627043f9029000bf08c0c71df59cde4143fc92a014f6a993b26
PKG_DESCR:=		opentype text shaping engine
PKG_SECTION:=		libs/fonts
PKG_SITES:=		http://www.freedesktop.org/software/harfbuzz/release/
PKG_DEPENDS:=		libstdcxx cairo icu4c
PKG_BUILDDEP:=		libstdcxx cairo icu4c
HOST_BUILDDEP:=		cairo-host icu4c-host
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,HARFBUZZ,harfbuzz,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,HARFBUZZ,harfbuzz,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

pre-install:
	$(INSTALL_DIR) $(WRKINST)/usr/include/harfbuzz
	$(CP) $(WRKBUILD)/src/hb-icu.h $(WRKINST)/usr/include/harfbuzz

harfbuzz-install:
	$(INSTALL_DIR) $(IDIR_HARFBUZZ)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libharfbuzz*.so* \
		$(IDIR_HARFBUZZ)/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
