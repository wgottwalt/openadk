# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libebml
PKG_VERSION:=		1.3.4
PKG_RELEASE:=		1
PKG_HASH:=		c50d3ecf133742c6549c0669c3873f968e11a365a5ba17b2f4dc339bbe51f387
PKG_DESCR:=		extensible binary meta language library
PKG_SECTION:=		libs/misc
PKG_URL:=		https://www.matroska.org/
PKG_SITES:=		http://dl.matroska.org/downloads/libebml/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBEBML,libebml,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

libebml-install:
	$(INSTALL_DIR) $(IDIR_LIBEBML)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libebml*.so* \
		$(IDIR_LIBEBML)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
