# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ipsec-tools
PKG_VERSION:=		0.8.2
PKG_RELEASE:=		2
PKG_HASH:=		8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d
PKG_DESCR:=		ipsec management tools
PKG_SECTION:=		net/security
PKG_DEPENDS:=		libressl
PKG_BUILDDEP:=		flex libressl
PKG_KDEPENDS:=		net-key
PKG_URL:=		http://ipsec-tools.sourceforge.net/
PKG_SITES:=		$(MASTER_SITE_SOURCEFORGE:=ipsec-tools/)

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

PKG_FLAVOURS_IPSEC_TOOLS:=	WITH_IPV6
PKGFD_WITH_IPV6:=		enable ipv6 support

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,IPSEC_TOOLS,ipsec-tools,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ARGS+=	--with-kernel-headers="$(LINUX_DIR)/include" \
			--with-openssl="$(STAGING_TARGET_DIR)/usr" \
			--without-readline \
			--disable-security-context \
			--without-libradius \
			--without-libpam

ifneq ($(ADK_PACKAGE_IPSEC_TOOLS_WITH_IPV6),)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

ipsec-tools-install:
	$(INSTALL_DIR) $(IDIR_IPSEC_TOOLS)/etc
	$(INSTALL_DIR) $(IDIR_IPSEC_TOOLS)/usr/lib
	$(INSTALL_DIR) $(IDIR_IPSEC_TOOLS)/usr/sbin 
	$(INSTALL_DATA) $(WRKBUILD)/src/racoon/samples/racoon.conf \
		$(IDIR_IPSEC_TOOLS)/etc
	$(CP) $(WRKINST)/usr/lib/lib{racoon,ipsec}.so.* \
		$(IDIR_IPSEC_TOOLS)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/{racoon,racoonctl,setkey,plainrsa-gen} \
		$(IDIR_IPSEC_TOOLS)/usr/sbin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
