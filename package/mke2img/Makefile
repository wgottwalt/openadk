# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mke2img
PKG_VERSION:=		1
PKG_RELEASE:=		1
PKG_DESCR:=		wrapper for ext2/3/4 filesystem utility
PKG_SECTION:=		sys/fs

NO_DISTFILES:=		1

PKG_CFLINE_MKE2IMG:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,MKE2IMG,mke2img,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

mke2img-hostinstall:
	$(INSTALL_DIR) $(STAGING_HOST_DIR)/usr/bin
	$(INSTALL_BIN) ./files/mke2img $(STAGING_HOST_DIR)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
