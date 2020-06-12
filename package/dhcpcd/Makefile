# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		dhcpcd
PKG_VERSION:=		9.1.1
PKG_RELEASE:=		1
PKG_HASH:=		bb742911be1f660db42a7323acc793b587f467c5de5b7186735c16d20204737d
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
