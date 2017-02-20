# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		hugo
PKG_VERSION:=		0.18.1
PKG_RELEASE:=		1
PKG_HASH:=		29db2524a3042f507162164ec3ce9071277a7608547f4ea4f739d63cac4b39e4
PKG_DESCR:=		fast website generator
PKG_SECTION:=		net/http
PKG_BUILDDEP:=		go-host
PKG_URL:=		https://gohugo.io
PKG_SITES:=		https://github.com/spf13/hugo/archive/

DISTFILES:=             v$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HUGO,hugo,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

include $(ADK_TOPDIR)/mk/go.mk

do-build:
	(cd $(WRKBUILD) && $(ADK_GO_TARGET_ENV) $(ADK_GO) \
		get -v github.com/spf13/hugo)

hugo-install:
	$(INSTALL_DIR) $(IDIR_HUGO)/usr/bin
	$(INSTALL_BIN) $(ADK_GO_BINPATH)/hugo \
		$(IDIR_HUGO)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
