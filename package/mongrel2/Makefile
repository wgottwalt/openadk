# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mongrel2
PKG_VERSION:=		1.9.1
PKG_RELEASE:=		1
PKG_HASH:=		dc491c9b06f1b32020fd977737fa16f99af6d99e7bfb2f80fcc53278dd44f398
PKG_DESCR:=		application, language, and network architecture agnostic web server
PKG_SECTION:=		net/http
PKG_BUILDDEP:=		zeromq sqlite
PKG_DEPENDS:=		zeromq libsqlite libpthread librt libstdcxx
PKG_URL:=		http://mongrel2.org
PKG_SITES:=		https://github.com/zedshaw/mongrel2/releases/download/v1.9.1/

DISTFILES:=             $(PKG_NAME)-v$(PKG_VERSION).tar.gz
WRKDIST=		${WRKDIR}/$(PKG_NAME)-v$(PKG_VERSION)

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MONGREL2,mongrel2,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual

mongrel2-install:
	$(INSTALL_DIR) $(IDIR_MONGREL2)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mongrel2 \
		$(IDIR_MONGREL2)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
