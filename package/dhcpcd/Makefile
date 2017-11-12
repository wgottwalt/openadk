# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		dhcpcd
PKG_VERSION:=		6.11.5
PKG_RELEASE:=		1
PKG_HASH:=		6f9674dc7e27e936cc787175404a6171618675ecfb6903ab9887b1b66a87d69e
PKG_DESCR:=		dhcp client
PKG_SECTION:=		net/dns
PKG_URL:=		https://roy.marples.name/projects/dhcpcd
PKG_SITES:=		https://roy.marples.name/downloads/dhcpcd/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DHCPCD,dhcpcd,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

dhcpcd-install:
	$(INSTALL_DIR) $(IDIR_DHCPCD)/etc
	$(CP) $(WRKINST)/etc/dhcpcd.conf \
		$(IDIR_DHCPCD)/etc
	$(INSTALL_DIR) $(IDIR_DHCPCD)/usr/share/dhcpcd
	$(CP) $(WRKINST)/usr/share/dhcpcd/* \
		$(IDIR_DHCPCD)/usr/share/dhcpcd
	$(INSTALL_DIR) $(IDIR_DHCPCD)/usr/libexec
	$(CP) $(WRKINST)/usr/libexec/* \
		$(IDIR_DHCPCD)/usr/libexec
	$(INSTALL_DIR) $(IDIR_DHCPCD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/dhcpcd \
		$(IDIR_DHCPCD)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
