# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		jq
PKG_VERSION:=		1.4
PKG_RELEASE:=		1
PKG_HASH:=		998c41babeb57b4304e65b4eb73094279b3ab1e63801b6b4bddd487ce009b39d
PKG_DESCR:=		command-line json processor
PKG_SECTION:=		sys/misc
PKG_URL:=		http://stedolan.github.io/jq/
PKG_SITES:=		http://stedolan.github.io/jq/download/source/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,JQ,jq,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

jq-install:
	$(INSTALL_DIR) $(IDIR_JQ)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/jq \
		$(IDIR_JQ)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
