# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lzma
PKG_VERSION:=		4.32.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		2a748b77a2f8c3cbc322dbd0b4c9d06a
PKG_DESCR:=		LZMA compression utility
PKG_SECTION:=		archive
PKG_URL:=		http://tukaani.org/lzma/
PKG_SITES:=		http://tukaani.org/lzma/

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LZMA,lzma,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LZMA,lzma,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto

lzma-install:
	$(INSTALL_DIR) $(IDIR_LZMA)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lzma $(IDIR_LZMA)/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
