# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		stats
PKG_VERSION:=		82bd4977b607b8714f361467e37a9d801ff911b6
PKG_RELEASE:=		1
PKG_GIT:=		hash
PKG_DESCR:=		stats utility
PKG_SECTION:=		sys/utils
PKG_URL:=		https://github.com/rustyrussell/stats
PKG_SITES:=		http://github.com/rustyrussell/stats.git

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,STATS,$(PKG_NAME),$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

stats-install:
	$(INSTALL_DIR) $(IDIR_STATS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/stats \
		$(IDIR_STATS)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
