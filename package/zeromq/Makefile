# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		zeromq
PKG_VERSION:=		4.2.3
PKG_RELEASE:=		1
PKG_HASH:=		8f1e2b2aade4dbfde98d82366d61baef2f62e812530160d2e6d0a5bb24e40bc0
PKG_DESCR:=		transport layer for distributed apps
PKG_SECTION:=		libs/misc
PKG_NEEDS:=		threads c++
PKG_URL:=		http://www.zeromq.org
PKG_SITES:=		https://github.com/zeromq/libzmq/releases/download/v4.2.3/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ZEROMQ,zeromq,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--without-libsodium \
			--disable-Werror \
			--without-documentation

zeromq-install:
	$(INSTALL_DIR) $(IDIR_ZEROMQ)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libzmq*.so* \
		$(IDIR_ZEROMQ)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
