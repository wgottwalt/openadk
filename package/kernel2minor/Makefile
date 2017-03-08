# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		kernel2minor
PKG_VERSION:=		2cacb4dec6673a60a972a3a7f7629464a26a8492
PKG_RELEASE:=		1
PKG_GIT:=		hash
PKG_DESCR:=		kernel to Mikrotik NOR
PKG_SECTION:=		sys/fs
PKG_URL:=		https://github.com/adron-s/kernel2minor
PKG_SITES:=		https://github.com/adron-s/kernel2minor.git

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,KERNEL2MINOR,kernel2minor,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,KERNEL2MINOR,kernel2minor,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

HOST_STYLE:=		auto
HOST_CONFIG_STYLE:=	manual
HOST_INSTALL_STYLE:=	manual

kernel2minor-hostinstall:
	$(INSTALL_DIR) $(STAGING_HOST_DIR)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/kernel2minor $(STAGING_HOST_DIR)/usr/sbin

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

kernel2minor-install:
	$(INSTALL_DIR) $(IDIR_KERNEL2MINOR)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/kernel2minor \
		$(IDIR_KERNEL2MINOR)/usr/sbin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
