# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		flex
PKG_VERSION:=		2.6.2
PKG_RELEASE:=		1
PKG_HASH:=		9a01437a1155c799b7dc2508620564ef806ba66250c36bf5f9034b1c207cb2c9
PKG_DESCR:=		fast lexical analyzer
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		m4-host
HOST_BUILDDEP:=		m4-host bison-host patch-host libtool-host
PKG_URL:=		https://github.com/westes/flex
PKG_SITES:=		https://github.com/westes/flex/releases/download/v$(PKG_VERSION)/
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,FLEX,flex,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,FLEX,flex,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

AUTOTOOL_STYLE:=	autoreconf
HOST_MAKE_FLAGS+=	STAGE1FLEX=$(WRKSRC)/src/stage1flex 
MAKE_FLAGS+=		STAGE1FLEX=$(STAGING_HOST_DIR)/usr/bin/stage1flex
CONFIGURE_ENV+=		ac_cv_path_HELP2MAN=true
CONFIGURE_ARGS+=	--disable-shared

hostpost-install:
	(cd $(STAGING_HOST_DIR)/usr/bin; ln -sf flex lex)
	$(CP) $(WRKBUILD)/src/stage1flex $(STAGING_HOST_DIR)/usr/bin

flex-install:
	$(INSTALL_DIR) $(IDIR_FLEX)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/flex $(IDIR_FLEX)/usr/bin

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
