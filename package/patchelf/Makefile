# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		patchelf
PKG_VERSION:=		0.8
PKG_RELEASE:=		1
PKG_HASH:=		14af06a2da688d577d64ff8dac065bb8903bbffbe01d30c62df7af9bf4ce72fe
PKG_DESCR:=		elf manipulation tool
PKG_SECTION:=		dev/tools
PKG_DEPENDS:=		libstdcxx
PKG_URL:=		http://nixos.org/releases/patchelf
PKG_SITES:=		http://nixos.org/releases/patchelf/patchelf-0.8/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,PATCHELF,patchelf,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,PATCHELF,patchelf,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

patchelf-install:
	$(INSTALL_DIR) $(IDIR_PATCHELF)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/patchelf \
		$(IDIR_PATCHELF)/usr/bin

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
