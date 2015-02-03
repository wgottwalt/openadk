# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		cyassl
PKG_VERSION:=		3.3.0
PKG_RELEASE:=		1
PKG_HASH:=		7ce5f704ec4ad72e4b955aeec732ad8a38e8dcd1f93bfc79dfda7c4bc894c67e
PKG_DESCR:=		portable embedded ssl library
PKG_SECTION:=		libs/crypto
PKG_URL:=		http://www.wolfssl.com
PKG_SITES:=		http://www.openadk.org/distfiles/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CYASSL,cyassl,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--disable-examples
CONFIGURE_ENV+=		C_EXTRA_FLAGS='$(TARGET_CFLAGS)'

cyassl-install:
	$(INSTALL_DIR) $(IDIR_CYASSL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcyassl*.so* \
		$(IDIR_CYASSL)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
