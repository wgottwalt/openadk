# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		diffutils
PKG_VERSION:=		3.3
PKG_RELEASE:=		1
PKG_HASH:=		a25e89a8ab65fded1731e4186be1bb25cda967834b6df973599cdcd5abdfc19c
PKG_DESCR:=		show differences between two files
PKG_SECTION:=		sys/utils
PKG_URL:=		http://www.gnu.org/software/diffutils/
PKG_SITES:=		$(MASTER_SITE_GNU:=$(PKG_NAME)/)
PKG_BB:=		1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DIFFUTILS,diffutils,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ENV+=		ac_use_included_regex=no

diffutils-install:
	$(INSTALL_DIR) $(IDIR_DIFFUTILS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/diff $(IDIR_DIFFUTILS)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
