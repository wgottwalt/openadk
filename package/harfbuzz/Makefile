# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		harfbuzz
PKG_VERSION:=		0.9.9
PKG_RELEASE:=		3
PKG_MD5SUM:=		e901ffe556d706b7d43b272f83be7f09
PKG_DESCR:=		OpenType text shaping engine
PKG_SECTION:=		libs
PKG_SITES:=		http://www.freedesktop.org/software/harfbuzz/release/
PKG_DEPENDS:=		libstdcxx cairo icu4c
PKG_BUILDDEP:=		libstdcxx cairo icu4c
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	!m68k

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HARFBUZZ,harfbuzz,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

pre-install:
	$(INSTALL_DIR) $(WRKINST)/usr/include/harfbuzz
	$(CP) $(WRKBUILD)/src/hb-icu.h $(WRKINST)/usr/include/harfbuzz

harfbuzz-install:
	$(INSTALL_DIR) $(IDIR_HARFBUZZ)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libharfbuzz*.so* \
		$(IDIR_HARFBUZZ)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
