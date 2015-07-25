# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		schedtool
PKG_VERSION:=		1.3.0
PKG_RELEASE:=		1
PKG_HASH:=		4e002a2a619d592f7c9b9d284381ffc004d8a71c38945aa95d5d53f2e4c0c8cf
PKG_DESCR:=		scheduler tool	
PKG_SECTION:=		sys/misc
#PKG_DEPENDS:=		add dependendant package names
#PKG_BUILDDEP:=		add packages which need to be compiled
PKG_URL:=		http://freequaos.host.sk/schedtool/
PKG_SITES:=		http://freequaos.host.sk/schedtool/

# if downloaded package is not ending with .tar.xz use following
DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SCHEDTOOL,schedtool,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual

schedtool-install:
	$(INSTALL_DIR) $(IDIR_SCHEDTOOL)/bin
	$(INSTALL_BIN) $(WRKINST)/bin/schedtool \
		$(IDIR_SCHEDTOOL)/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
