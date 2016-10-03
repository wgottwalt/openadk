# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		zeromq
PKG_VERSION:=		4.1.5
PKG_RELEASE:=		1
PKG_HASH:=		04aac57f081ffa3a2ee5ed04887be9e205df3a7ddade0027460b8042432bdbcf
PKG_DESCR:=		transport layer for distributed apps
PKG_SECTION:=		libs/misc
PKG_NEEDS:=		threads c++
PKG_URL:=		http://www.zeromq.org
PKG_SITES:=		https://github.com/zeromq/zeromq4-1/releases/download/v$(PKG_VERSION)/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ZEROMQ,zeromq,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--without-libsodium \
			--without-documentation

zeromq-install:
	$(INSTALL_DIR) $(IDIR_ZEROMQ)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libzmq*.so* \
		$(IDIR_ZEROMQ)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
