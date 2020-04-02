# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		lzma
PKG_VERSION:=		4.32.7
PKG_RELEASE:=		1
PKG_HASH:=		02aa57f995d15b7acb7c2496d88a39fb0124ea00bf027cc61dd24eddb5942dff
PKG_DESCR:=		compression utility
PKG_SECTION:=		app/archive
PKG_NEEDS:=		c++
PKG_URL:=		http://tukaani.org/lzma/
PKG_SITES:=		http://tukaani.org/lzma/

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LZMA,lzma,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LZMA,lzma,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto

lzma-install:
	$(INSTALL_DIR) $(IDIR_LZMA)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lzma $(IDIR_LZMA)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
