# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		bcm2835
PKG_VERSION:=		1.52
PKG_RELEASE:=		1
PKG_HASH:=		b9fd10f7a80aadaed28a77168709b7c519568a63b6e98d0a50e9c5fe31bea6bb
PKG_DESCR:=		the BCM2835 direct hardware access library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.airspayce.com/mikem/bcm2835/
PKG_SITES:=		http://www.airspayce.com/mikem/bcm2835/

PKG_SYSTEM_DEPENDS:=    raspberry-pi raspberry-pi2 raspberry-pi3

DISTFILES:=		bcm2835-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBBCM2835,libbcm2835,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

bcm2835-install:
	$(INSTALL_DIR) $(IDIR_LIBBCM2835)/usr/lib
	$(INSTALL_DIR) $(IDIR_LIBBCM2835)/usr/include

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
