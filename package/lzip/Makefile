# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		lzip
PKG_VERSION:=		1.17
PKG_RELEASE:=		1
PKG_HASH:=		9443855e0a33131233b22cdb6c62c9313a483f16cc7415efe88d4a494cea0352
PKG_DESCR:=		compression utility
PKG_SECTION:=		app/archive
PKG_URL:=		http://www.nongnu.org/lzip/lzip.html
PKG_SITES:=		http://download.savannah.gnu.org/releases/lzip/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LZIP,lzip,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LZIP,lzip,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lzip-install:
	$(INSTALL_DIR) $(IDIR_LZIP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lzip $(IDIR_LZIP)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
