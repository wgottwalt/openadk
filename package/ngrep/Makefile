# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ngrep
PKG_VERSION:=		1.45
PKG_RELEASE:=		1
PKG_HASH:=		aea6dd337da8781847c75b3b5b876e4de9c58520e0d77310679a979fc6402fa7
PKG_DESCR:=		network grep
PKG_SECTION:=		net/debug
PKG_DEPENDS:=		libpcap libpcre
PKG_BUILDDEP:=		libpcap pcre
PKG_URL:=		http://ngrep.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ngrep/}

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NGREP,ngrep,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ARGS+=	--disable-pcap-restart \
			--with-pcap-includes=$(STAGING_TARGET_DIR)/usr/include

ngrep-install:
	$(INSTALL_DIR) $(IDIR_NGREP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ngrep \
		$(IDIR_NGREP)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
