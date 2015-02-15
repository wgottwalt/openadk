# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		upx
PKG_VERSION:=		3.91
PKG_RELEASE:=		1
PKG_HASH:=		527ce757429841f51675352b1f9f6fc8ad97b18002080d7bf8672c466d8c6a3c
PKG_DESCR:=		ultimate packer for executables
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		libucl zlib
PKG_BUILDDEP:=		ucl zlib
PKG_URL:=		http://upx.sourceforge.net
PKG_SITES:=		http://upx.sourceforge.net/download/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION)-src.tar.bz2
WRKDIST=		$(WRKDIR)/$(PKG_NAME)-$(PKG_VERSION)-src

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,UPX,upx,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,UPX,upx,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

upx-install:
	$(INSTALL_DIR) $(IDIR_UPX)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/src/upx.out \
		$(IDIR_UPX)/usr/bin

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
