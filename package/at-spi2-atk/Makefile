# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		at-spi2-atk
PKG_VERSION:=		2.15.3
PKG_EXTRAVER:=		2.15
PKG_RELEASE:=		2
PKG_HASH:=		eaef8fcf2775e35e1e054840940808775dfa9b71bcd7bda1dd6ecbdf5b1a9e18
PKG_DESCR:=		d-bus based accessibility framework
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		glib libxtst
PKG_BUILDDEP:=		glib libXtst
PKG_URL:=		http://www.gnome.org/
PKG_SITES:=		$(MASTER_SITE_GNOME:=at-spi2-atk/$(PKG_EXTRAVER)/)
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AT_SPI2_ATK,at-spi2-atk,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

at-spi2-atk-install:
	$(INSTALL_DIR) $(IDIR_AT_SPI2_ATK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libat*.so* $(IDIR_AT_SPI2_ATK)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
