# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		zeromq
PKG_VERSION:=		4.1.4
PKG_RELEASE:=		1
PKG_HASH:=		e99f44fde25c2e4cb84ce440f87ca7d3fe3271c2b8cfbc67d55e4de25e6fe378
PKG_DESCR:=		transport layer for distributed apps
PKG_SECTION:=		libs/misc
PKG_NEEDS:=		threads rt c++
PKG_URL:=		http://www.zeromq.org
PKG_SITES:=		http://download.zeromq.org/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ZEROMQ,zeromq,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--without-libsodium

zeromq-install:
	$(INSTALL_DIR) $(IDIR_ZEROMQ)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libzmq*.so* \
		$(IDIR_ZEROMQ)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
