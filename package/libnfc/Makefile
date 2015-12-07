# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnfc
PKG_VERSION:=		1.7.1
PKG_RELEASE:=		1
PKG_HASH:=		945e74d8e27683f9b8a6f6e529557b305d120df347a960a6a7ead6cb388f4072
PKG_DESCR:=		nfc library and tools
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libusb libusb-compat
PKG_BUILDDEP:=		libusb libusb-compat
PKG_NEEDS:=		threads
PKG_URL:=		http://nfc-tools.org
PKG_SITES:=		https://bintray.com/artifact/download/nfc-tools/sources/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNFC,libnfc,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

libnfc-install:
	$(INSTALL_DIR) $(IDIR_LIBNFC)/usr/lib
	$(INSTALL_DIR) $(IDIR_LIBNFC)/usr/bin
	$(CP) $(WRKINST)/usr/lib/libnfc*.so* \
		$(IDIR_LIBNFC)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* \
		$(IDIR_LIBNFC)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
