# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		lzop
PKG_VERSION:=		1.04
PKG_RELEASE:=		1
PKG_HASH:=		7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41
PKG_DESCR:=		compression utility
PKG_SECTION:=		app/archive
PKG_DEPENDS:=		liblzo
PKG_BUILDDEP:=		liblzo
HOST_BUILDDEP:=		liblzo-host
PKG_URL:=		http://www.lzop.org/
PKG_SITES:=		http://www.lzop.org/download/
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LZOP,lzop,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LZOP,lzop,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lzop-install:
	$(INSTALL_DIR) $(IDIR_LZOP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lzop $(IDIR_LZOP)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
