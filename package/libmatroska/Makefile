# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libmatroska
PKG_VERSION:=		1.4.4
PKG_RELEASE:=		1
PKG_HASH:=		d3efaa9f6d3964351a05bea0f848a8d5dc570e4791f179816ce9a93730296bd7
PKG_DESCR:=		multimedia container format library
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libebml
PKG_BUILDDEP:=		libebml
PKG_NEEDS:=		c++
PKG_URL:=		https://www.matroska.org/
PKG_SITES:=		https://dl.matroska.org/downloads/libmatroska/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMATROSKA,libmatroska,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

libmatroska-install:
	$(INSTALL_DIR) $(IDIR_LIBMATROSKA)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmatroska*.so* \
		$(IDIR_LIBMATROSKA)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
