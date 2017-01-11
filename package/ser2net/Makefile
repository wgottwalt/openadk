# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ser2net
PKG_VERSION:=		3.3
PKG_RELEASE:=		1
PKG_HASH:=		3d1cef5f48df8291e57d4d7d4eac2fc809ae644a5524ffca4aebef0f4e4153dc
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
