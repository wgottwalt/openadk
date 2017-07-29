# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		keyutils
PKG_VERSION:=		1.5.10
PKG_RELEASE:=		1
PKG_HASH:=		115c3deae7f181778fd0e0ffaa2dad1bf1fe2f5677cf2e0e348cdb7a1c93afb6
PKG_DESCR:=		utilities for managing the key retention facility
PKG_SECTION:=		libs/misc
PKG_SITES:=		http://people.redhat.com/dhowells/keyutils/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KEYUTILS,keyutils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual

keyutils-install:
	$(INSTALL_DIR) $(IDIR_KEYUTILS)/usr/lib
	$(CP) $(WRKBUILD)/libkeyutils.so* \
		$(IDIR_KEYUTILS)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
