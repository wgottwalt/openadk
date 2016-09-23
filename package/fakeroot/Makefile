# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		fakeroot
PKG_VERSION:=		1.20.2
PKG_RELEASE:=		1
PKG_HASH:=		7c0a164d19db3efa9e802e0fc7cdfeff70ec6d26cdbdc4338c9c2823c5ea230c
PKG_DESCR:=		fake root permissions
PKG_SECTION:=		sys/utils
PKG_SITES:=		http://http.debian.net/debian/pool/main/f/fakeroot/
HOST_BUILDDEP:=		libcap-host

PKG_CFLINE_FAKEROOT:=	depends on ADK_HOST_ONLY

DISTFILES:=             $(PKG_NAME)_$(PKG_VERSION).orig.tar.bz2

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,FAKEROOT,fakeroot,$(PKG_VERSION)-${PKG_RELEASE}))

fakeroot-install:
	$(INSTALL_DIR) $(IDIR_FAKEROOT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/fakeroot \
		$(IDIR_FAKEROOT)/usr/bin

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
