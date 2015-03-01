# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ipmitool
PKG_VERSION:=		1.8.15
PKG_RELEASE:=		1
PKG_HASH:=		f0964e644a8e693932a3e8da6929d5598ed24645bacd51fbb1a4a09b5e47cf78
PKG_DESCR:=		utility for controlling ipmi enabled devices
PKG_SECTION:=		net/misc
PKG_URL:=		http://ipmitool.sf.net/
PKG_SITES:=		$(MASTER_SITE_SOURCEFORGE:=ipmitool/)

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,IPMITOOL,ipmitool,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes

ipmitool-install:
	$(INSTALL_DIR) $(IDIR_IPMITOOL)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ipmitool \
		$(IDIR_IPMITOOL)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
