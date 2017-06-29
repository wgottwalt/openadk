# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		jq
PKG_VERSION:=		1.5
PKG_RELEASE:=		1
PKG_HASH:=		c4d2bfec6436341113419debf479d833692cc5cdab7eb0326b5a4d4fbe9f493c
PKG_DESCR:=		command-line json processor
PKG_SECTION:=		sys/misc
PKG_URL:=		http://stedolan.github.io/jq/
PKG_SITES:=		https://github.com/stedolan/jq/releases/download/jq-$(PKG_VERSION)/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,JQ,jq,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

jq-install:
	$(INSTALL_DIR) $(IDIR_JQ)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/jq \
		$(IDIR_JQ)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
