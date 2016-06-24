# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libarchive
PKG_VERSION:=		3.2.1
PKG_RELEASE:=		1
PKG_HASH:=		72ee1a4e3fd534525f13a0ba1aa7b05b203d186e0c6072a8a4738649d0b3cfd2
PKG_DESCR:=		multiformat archive and compression library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.libarchive.org/
PKG_SITES:=		http://www.libarchive.org/downloads/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBARCHIVE,libarchive,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,LIBARCHIVE,libarchive,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--without-xml2

libarchive-install:
	$(INSTALL_DIR) $(IDIR_LIBARCHIVE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libarchive*.so* \
		$(IDIR_LIBARCHIVE)/usr/lib

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
