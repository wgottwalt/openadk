# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mISDN
PKG_VERSION:=		1_1_9_2
PKG_RELEASE:=		1
PKG_HASH:=		9ff96d8361891b9a15cf6dbdb57214c36ca13702d5bf7c18ebe259ec5d876c09
PKG_DESCR:=		new isdn stack of the linux kernel
PKG_SECTION:=		net/voip
PKG_URL:=		http://www.misdn.org
PKG_SITES:=		http://www.misdn.org/downloads/releases/

PKG_CFLINE_MISDN:=	depends on ADK_BROKEN

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/$(ADK_TARGET_OS)-ver.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MISDN,misdn,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		LINUX=$(LINUX_DIR) KVERS=$(KERNEL_VERSION)
FAKE_FLAGS+=		INSTALL_PREFIX=$(WRKINST)

misdn-install:
	$(INSTALL_DIR) $(IDIR_MISDN)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/{mISDN,misdn-init} \
		$(IDIR_MISDN)/usr/sbin
	$(INSTALL_DIR) $(IDIR_MISDN)/lib/modules
	$(CP) $(WRKINST)/lib/modules/* $(IDIR_MISDN)/lib/modules/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
