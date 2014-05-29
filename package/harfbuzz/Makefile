# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		harfbuzz
PKG_VERSION:=		0.9.28
PKG_RELEASE:=		1
PKG_MD5SUM:=		accbeb679f39d839038b95a87e40870e
PKG_DESCR:=		opentype text shaping engine
PKG_SECTION:=		libs/fonts
PKG_SITES:=		http://www.freedesktop.org/software/harfbuzz/release/
PKG_DEPENDS:=		libstdcxx cairo icu4c
PKG_BUILDDEP:=		libstdcxx cairo icu4c
HOST_BUILDDEP:=		cairo-host icu4c-host
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	!m68k

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,HARFBUZZ,harfbuzz,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,HARFBUZZ,harfbuzz,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

pre-install:
	$(INSTALL_DIR) $(WRKINST)/usr/include/harfbuzz
	$(CP) $(WRKBUILD)/src/hb-icu.h $(WRKINST)/usr/include/harfbuzz

harfbuzz-install:
	$(INSTALL_DIR) $(IDIR_HARFBUZZ)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libharfbuzz*.so* \
		$(IDIR_HARFBUZZ)/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
