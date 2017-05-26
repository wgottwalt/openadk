# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		diffutils
PKG_VERSION:=		3.6
PKG_RELEASE:=		1
PKG_HASH:=		d621e8bdd4b573918c8145f7ae61817d1be9deb4c8d2328a65cea8e11d783bd6
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
