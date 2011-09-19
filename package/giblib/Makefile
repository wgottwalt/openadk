# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		giblib
PKG_VERSION:=		1.2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		c810ef5389baf24882a1caca2954385e
PKG_DESCR:=		imlib2 wrapper library
PKG_SECTION:=		libs
PKG_SITES:=		http://linuxbrit.co.uk/downloads/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GIBLIB,giblib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

giblib-install:
	$(INSTALL_DIR) $(IDIR_GIBLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgiblib*so* \
		$(IDIR_GIBLIB)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
