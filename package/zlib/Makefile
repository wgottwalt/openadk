# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		zlib
PKG_VERSION:=		1.2.8
PKG_RELEASE:=		1
PKG_HASH:=		831df043236df8e9a7667b9e3bb37e1fcb1220a0f163b6de2626774b9590d057
PKG_DESCR:=		implementation of the deflate compression method
PKG_SECTION:=		libs/comp
PKG_URL:=		http://www.zlib.net/
PKG_SITES:=		http://zlib.net/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ZLIB,zlib,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		manual
CONFIGURE_ENV+=		uname=Linux

ifeq ($(ADK_TARGET_BINFMT_FLAT)$(ADK_TARGET_USE_STATIC_LIBS_ONLY),)
CONFIGURE_OPTS:=	--shared
endif

ALL_TARGET:=		libz.a 
ifeq ($(ADK_TARGET_BINFMT_FLAT)$(ADK_TARGET_USE_STATIC_LIBS_ONLY),)
ALL_TARGET+=		libz.so.$(PKG_VERSION)
endif

do-configure:
	(cd $(WRKBUILD); \
		uname="Linux" \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
		CPPFLAGS="-I$(STAGING_TARGET_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_TARGET_DIR)/usr/lib" \
		./configure \
		--prefix=/usr \
		$(CONFIGURE_OPTS) \
	);

zlib-install:
	$(INSTALL_DIR) $(IDIR_ZLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libz.so* $(IDIR_ZLIB)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
