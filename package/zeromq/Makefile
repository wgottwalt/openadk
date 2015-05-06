# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		zeromq
PKG_VERSION:=		4.0.5
PKG_RELEASE:=		1
PKG_HASH:=		3bc93c5f67370341428364ce007d448f4bb58a0eaabd0a60697d8086bc43342b
PKG_DESCR:=		transport layer for distributed apps
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.zeromq.org
PKG_SITES:=		http://download.zeromq.org/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ZEROMQ,zeromq,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

zeromq-install:
	$(INSTALL_DIR) $(IDIR_ZEROMQ)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libzmq*.so* \
		$(IDIR_ZEROMQ)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
