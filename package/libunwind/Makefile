# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libunwind
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_HASH:=		3f3ecb90e28cbe53fba7a4a27ccce7aad188d3210bb1964a923a731a27a75acb
PKG_DESCR:=		determine the call-chain of a program
PKG_SECTION:=		libs/misc
PKG_URL:=		https://savannah.nongnu.org/projects/libunwind/
PKG_SITES:=		http://download.savannah.nongnu.org/releases/libunwind/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBUNWIND,libunwind,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

libunwind-install:
	$(INSTALL_DIR) $(IDIR_LIBUNWIND)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libunwind*.so* \
		$(IDIR_LIBUNWIND)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
