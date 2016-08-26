# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		flex
PKG_VERSION:=		2.6.1
PKG_RELEASE:=		1
PKG_HASH:=		2c7a412c1640e094cb058d9b2fe39d450186e09574bebb7aa28f783e3799103f
PKG_DESCR:=		fast lexical analyzer
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		m4-host
HOST_BUILDDEP:=		m4-host autoconf-host libtool-host
PKG_URL:=		https://github.com/westes/flex
PKG_SITES:=		https://github.com/westes/flex/releases/download/v2.6.1/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,FLEX,flex,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,FLEX,flex,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

AUTOTOOL_STYLE:=	autoreconf
HOST_MAKE_FLAGS+=	STAGE1FLEX=$(WRKSRC)/src/stage1flex
MAKE_FLAGS+=		STAGE1FLEX=$(STAGING_HOST_DIR)/usr/bin/stage1flex
CONFIGURE_ARGS+=	--disable-shared

hostpost-install:
	(cd $(STAGING_HOST_DIR)/usr/bin; ln -sf flex lex)
	$(CP) $(WRKBUILD)/src/stage1flex $(STAGING_HOST_DIR)/usr/bin

flex-install:
	$(INSTALL_DIR) $(IDIR_FLEX)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/flex $(IDIR_FLEX)/usr/bin

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
