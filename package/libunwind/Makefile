# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libunwind
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_HASH:=		1de38ffbdc88bd694d10081865871cd2bfbb02ad8ef9e1606aee18d65532b992
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
