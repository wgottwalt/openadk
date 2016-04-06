# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p11-kit
PKG_VERSION:=		0.23.2
PKG_RELEASE:=		1
PKG_HASH:=		ba726ea8303c97467a33fca50ee79b7b35212964be808ecf9b145e9042fdfaf0
PKG_DESCR:=		pkcs11 library
PKG_SECTION:=		libs/crypto
PKG_DEPENDS:=		libtasn1
PKG_BUILDDEP:=		libtasn1
PKG_URL:=		https://p11-glue.freedesktop.org/p11-kit.html
PKG_SITES:=		https://p11-glue.freedesktop.org/releases/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P11_KIT,p11-kit,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--disable-static

p11-kit-install:
	$(INSTALL_DIR) $(IDIR_P11_KIT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libp11-kit*.so* \
		$(IDIR_P11_KIT)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
