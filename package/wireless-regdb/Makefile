# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		wireless-regdb
PKG_VERSION:=		2015.01.30
PKG_RELEASE:=		1
PKG_HASH:=		438d7f3d62686bc997098d17fe1aff95c6f6ec061aaab90ab7c2c17e8451ce85
PKG_DESCR:=		binary regulatory database for crda
PKG_SECTION:=		libs/net
PKG_URL:=		http://wireless.kernel.org/en/developers/Regulatory
PKG_SITES:=		https://www.kernel.org/pub/software/network/wireless-regdb/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,WIRELESS_REGDB,$(PKG_NAME),$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	$(INSTALL_DIR) $(IDIR_WIRELESS_REGDB)/usr/lib/crda
	$(INSTALL_DATA) $(WRKDIST)/regulatory.bin \
		$(IDIR_WIRELESS_REGDB)/usr/lib/crda

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
