# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		nodm
PKG_VERSION:=		0.13
PKG_RELEASE:=		1
PKG_HASH:=		ef11667ae82846801a9633df36c20f632cc03319bb1da35f062ac0f950771273
PKG_DESCR:=		xorg display manager for autologin
PKG_SECTION:=		x11/misc
PKG_DEPENDS:=		pam
PKG_BUILDDEP:=		pam
PKG_SITES:=		https://github.com/spanezz/nodm/archive/

DISTFILES:=             $(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NODM,nodm,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

AUTOTOOL_STYLE=		autogen

nodm-install:
	$(INSTALL_DIR) $(IDIR_NODM)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/nodm \
		$(IDIR_NODM)/usr/sbin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
