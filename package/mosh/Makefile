# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mosh
PKG_VERSION:=		1.2.6
PKG_RELEASE:=		1
PKG_HASH:=		7e82b7fbfcc698c70f5843bb960dadb8e7bd7ac1d4d2151c9d979372ea850e85
PKG_DESCR:=		mobile shell
PKG_SECTION:=		net/security
PKG_DEPENDS:=		zlib ncurses libressl
PKG_BUILDDEP:=		protobuf-host protobuf zlib ncurses libressl
PKG_NEEDS:=		c++
PKG_URL:=		https://mosh.org/
PKG_SITES:=		https://mosh.org/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MOSH,mosh,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

mosh-install:
	$(INSTALL_DIR) $(IDIR_MOSH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mosh \
		$(IDIR_MOSH)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
