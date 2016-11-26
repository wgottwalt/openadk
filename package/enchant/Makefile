# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		enchant
PKG_VERSION:=		1.6.0
PKG_RELEASE:=		1
PKG_HASH:=		2fac9e7be7e9424b2c5570d8affe568db39f7572c10ed48d4e13cddf03f7097f
PKG_DESCR:=		spelling library
PKG_SECTION:=		libs/misc
PKG_SITES:=		http://www.abisource.com/downloads/enchant/1.6.0/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ENCHANT,enchant,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

enchant-install:
	$(INSTALL_DIR) $(IDIR_ENCHANT)/usr/lib/enchant
	$(CP) $(WRKINST)/usr/lib/libenchant.so* \
		$(IDIR_ENCHANT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/enchant/*.so* \
		$(IDIR_ENCHANT)/usr/lib/enchant

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
