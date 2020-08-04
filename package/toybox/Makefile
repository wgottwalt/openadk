# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		toybox
PKG_VERSION:=		0.8.3
PKG_RELEASE:=		1
PKG_HASH:=		eab28fd29d19d4e61ef09704e5871940e6f35fd35a3bb1285e41f204504b5c01
PKG_DESCR:=		linux tools collection
PKG_SECTION:=		base/apps
PKG_URL:=		http://landley.net/toybox/
PKG_SITES:=		http://landley.net/toybox/downloads/
PKG_BB:=		1

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TOYBOX,toybox,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		CC="gcc" V=1 PREFIX="$(WRKINST)"

do-configure:
	-rm $(WRKBUILD)/toys/other/swap*.c
	cd $(WRKBUILD); CC="gcc" PATH='$(HOST_PATH)' $(MAKE) defconfig

toybox-install:
	$(CP) $(WRKINST)/* $(IDIR_TOYBOX)/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
