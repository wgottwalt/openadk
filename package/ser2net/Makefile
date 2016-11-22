# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ser2net
PKG_VERSION:=		3.2
PKG_RELEASE:=		1
PKG_HASH:=		e91cf85ab2c1769e17be7726b133f8f3ad197e9d4b445bb0b0d2f3f97f88a083
PKG_DESCR:=		allowing network connections to serial ports
PKG_SECTION:=		net/misc
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ser2net/}

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SER2NET,ser2net,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

ser2net-install:
	$(INSTALL_DIR) $(IDIR_SER2NET)/etc $(IDIR_SER2NET)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/ser2net $(IDIR_SER2NET)/usr/sbin
	$(INSTALL_DATA) $(WRKBUILD)/ser2net.conf $(IDIR_SER2NET)/etc

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
