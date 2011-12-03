# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		icinga
PKG_VERSION:=		1.6.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		7b32e589235dd74ea020f12cbc90ec31
PKG_DESCR:=		network monitoring
PKG_SECTION:=		net
PKG_DEPENDS:=		mini-sendmail
PKG_URL:=		http://www.icinga.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=icinga/1.6.1/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ICINGA,icinga,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--sysconfdir=/etc/icinga

icinga-install:
	$(INSTALL_DIR) $(IDIR_ICINGA)/etc
	$(CP) ./src/etc/icinga $(IDIR_ICINGA)/etc
	$(INSTALL_DIR) $(IDIR_ICINGA)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/icinga \
		$(IDIR_ICINGA)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
