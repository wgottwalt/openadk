# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		strongswan
PKG_VERSION:=		4.4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		22dae13782f493ec675d54b67d79a66d
PKG_DESCR:=		IPsec software
PKG_SECTION:=		net/security
PKG_DEPENDS:=		libgmp ip libpthread kmod-net-key kmod-xfrm-user
PKG_DEPENDS+=		kmod-inet-ah kmod-inet-esp kmod-inet-ipcomp
PKG_DEPENDS+=		kmod-inet-xfrm-mode-tunnel kmod-inet-xfrm-mode-transport
PKG_DEPENDS+=		kmod-crypto-sha1 kmod-crypto-aes kmod-crypto-md5
PKG_DEPENDS+=		kmod-crypto-des kmod-crypto-hmac
PKG_DEPENDS+=		kmod-crypto-null kmod-crypto-cbc
PKG_BUILDDEP+=		gmp
PKG_URL:=		http://strongswan.org/index.htm
PKG_SITES:=		http://download.strongswan.org/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,STRONGSWAN,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-tools \
			--disable-sha2

post-install:
	$(INSTALL_DIR) $(IDIR_STRONGSWAN)/etc
	$(INSTALL_DIR) $(IDIR_STRONGSWAN)/usr/sbin
	$(INSTALL_DIR) $(IDIR_STRONGSWAN)/usr/lib
	$(INSTALL_DIR) $(IDIR_STRONGSWAN)/usr/libexec/ipsec/plugins
	$(CP) $(WRKINST)/usr/libexec/ipsec/plugins/*.so \
		$(IDIR_STRONGSWAN)/usr/libexec/ipsec/plugins
	$(CP) $(WRKINST)/etc/* $(IDIR_STRONGSWAN)/etc
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/ipsec/charon \
		$(IDIR_STRONGSWAN)/usr/libexec/ipsec
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/ipsec/_pluto_adns \
		$(IDIR_STRONGSWAN)/usr/libexec/ipsec
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/ipsec/starter \
		$(IDIR_STRONGSWAN)/usr/libexec/ipsec
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/ipsec/_updown \
		$(IDIR_STRONGSWAN)/usr/libexec/ipsec
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/ipsec/whack \
		$(IDIR_STRONGSWAN)/usr/libexec/ipsec
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/ipsec/_copyright \
		$(IDIR_STRONGSWAN)/usr/libexec/ipsec
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/ipsec/pluto \
		$(IDIR_STRONGSWAN)/usr/libexec/ipsec
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/ipsec/stroke \
		$(IDIR_STRONGSWAN)/usr/libexec/ipsec
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/ipsec/_updown_espmark \
		$(IDIR_STRONGSWAN)/usr/libexec/ipsec
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/ipsec \
		$(IDIR_STRONGSWAN)/usr/sbin
	$(CP) $(WRKINST)/usr/lib/lib*.so* \
		$(IDIR_STRONGSWAN)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
