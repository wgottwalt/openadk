# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		wireless-regdb
PKG_VERSION:=		2011.04.28
PKG_RELEASE:=		1
PKG_MD5SUM:=		16b7fabd4d7761ccf206702a3f18cce9
PKG_DESCR:=		Binary regulatory database for CRDA
PKG_SECTION:=		libs/net
PKG_URL:=		http://wireless.kernel.org/en/developers/Regulatory
PKG_SITES:=		http://wireless.kernel.org/download/wireless-regdb/
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2


include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,WIRELESS_REGDB,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	$(INSTALL_DIR) $(IDIR_WIRELESS_REGDB)/usr/lib/crda
	$(INSTALL_DATA) $(WRKDIST)/regulatory.bin \
		$(IDIR_WIRELESS_REGDB)/usr/lib/crda
	$(INSTALL_DIR) $(IDIR_WIRELESS_REGDB)/etc/wireless-regdb/pubkeys
	$(INSTALL_DATA) $(WRKDIST)/linville.key.pub.pem \
		$(IDIR_WIRELESS_REGDB)/etc/wireless-regdb/pubkeys


include ${ADK_TOPDIR}/mk/pkg-bottom.mk
