# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		usbids
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		usb id database
PKG_SECTION:=		sys/hw
PKG_SITES:=		http://www.linux-usb.org/
PKG_NOCHECKSUM:=	1

DISTFILES:=		usb.ids.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,USBIDS,usbids,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

usbids-install:
	$(INSTALL_DIR) $(IDIR_USBIDS)/usr/share
	$(CP) $(WRKSRC)/usb.ids.gz $(IDIR_USBIDS)/usr/share

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
