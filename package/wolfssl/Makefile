# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		wolfssl
PKG_VERSION:=		3.13.0
PKG_RELEASE:=		1
PKG_HASH:=		196a3256a9044ecb89504ce77850342c82e676e7f2cad77f5584be3516b6060e
PKG_DESCR:=		portable embedded ssl library
PKG_SECTION:=		libs/crypto
PKG_URL:=		http://www.wolfssl.com
PKG_SITES:=		http://distfiles.openadk.org/
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).zip

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,WOLFSSL,wolfssl,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--disable-examples
CONFIGURE_ENV+=		C_EXTRA_FLAGS='$(TARGET_CFLAGS)'

wolfssl-install:
	$(INSTALL_DIR) $(IDIR_WOLFSSL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libwolfssl*.so* \
		$(IDIR_WOLFSSL)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
