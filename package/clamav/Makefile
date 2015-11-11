# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		clamav
PKG_VERSION:=		0.98.7
PKG_RELEASE:=		1
PKG_HASH:=		282417b707740de13cd8f18d4cbca9ddd181cf96b444db2cad98913a5153e272
PKG_DESCR:=		anti-virus software
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		libressl libxml2 zlib libpthread
PKG_BUILDDEP:=		libressl libxml2 zlib
PKG_URL:=		http://www.clamav.net/
PKG_SITES:=		http://www.clamav.net/downloads/production/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CLAMAV,clamav,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

clamav-install:
	$(INSTALL_DIR) $(IDIR_CLAMAV)/etc
	$(CP) $(WRKINST)/etc/* \
		$(IDIR_CLAMAV)/etc
	$(INSTALL_DIR) $(IDIR_CLAMAV)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib*.so* \
		$(IDIR_CLAMAV)/usr/lib
	$(INSTALL_DIR) $(IDIR_CLAMAV)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* \
		$(IDIR_CLAMAV)/usr/bin
	$(INSTALL_DIR) $(IDIR_CLAMAV)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/clamd \
		$(IDIR_CLAMAV)/usr/sbin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
