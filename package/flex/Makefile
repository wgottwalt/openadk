# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		flex
PKG_VERSION:=		2.5.39
PKG_RELEASE:=		1
PKG_HASH:=		c988bb3ab340aaba16df5a54ab98bb4760599975375c8ac9388a078b7f27e9e8
PKG_DESCR:=		fast lexical analyzer
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		m4-host
HOST_BUILDDEP:=		m4-host
PKG_URL:=		http://flex.sourceforge.net/
PKG_SITES:=		$(MASTER_SITE_SOURCEFORGE:=flex/)
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,FLEX,flex,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,FLEX,flex,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

hostpost-install:
	(cd $(STAGING_HOST_DIR)/usr/bin; ln -sf flex lex)

flex-install:
	$(INSTALL_DIR) $(IDIR_FLEX)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/flex $(IDIR_FLEX)/usr/bin
	# workaround for dev subpackage
	$(INSTALL_DIR) $(IDIR_FLEX_DEV)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libfl.a \
		$(IDIR_FLEX_DEV)/usr/lib

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
