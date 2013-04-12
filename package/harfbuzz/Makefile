# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		harfbuzz
PKG_VERSION:=		0.9.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		e901ffe556d706b7d43b272f83be7f09
PKG_DESCR:=		OpenType text shaping engine
PKG_SECTION:=		libs
PKG_SITES:=		http://www.freedesktop.org/software/harfbuzz/release/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HARFBUZZ,harfbuzz,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-L$(STAGING_DIR)/usr/lib64 -L$(STAGING_DIR)/usr/lib32

harfbuzz-install:
	$(INSTALL_DIR) $(IDIR_HARFBUZZ)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libharfbuzz*.so* \
		$(IDIR_HARFBUZZ)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
