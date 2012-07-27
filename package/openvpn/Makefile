# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openvpn
PKG_VERSION:=		2.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		c5181e27b7945fa6276d21873329c5c7
PKG_DESCR:=		Open Source VPN solution using SSL
PKG_SECTION:=		net/security
PKG_DEPENDS:=		kmod-tun libopenssl ip
PKG_BUILDDEP:=		openssl
PKG_URL:=		http://openvpn.net/
PKG_SITES:=		http://swupdate.openvpn.org/community/releases/

PKG_SUBPKGS:=		OPENVPN OPENVPN_EASY_RSA
PKG_FLAVOURS_OPENVPN:=	WITH_LZO WITH_MANAGEMENT WITH_HTTPPROXY WITH_SOCKS SERVER CLIENT
PKGSS_OPENVPN_EASY_RSA:=openssl-util
PKGFD_SERVER:=		deliver server example configuration
PKGFD_CLIENT:=		deliver client example configuration
PKGFD_WITH_LZO:=	enable LZO compression support
PKGFS_WITH_LZO:=	liblzo
PKGFB_WITH_LZO:=	liblzo
PKGFD_WITH_MANAGEMENT:=	enable management server support
PKGFD_WITH_HTTPPROXY:=	enable http proxy support
PKGFD_WITH_SOCKS:=	enable socks proxy support

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPENVPN,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,OPENVPN_EASY_RSA,openvpn-easy-rsa,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifneq ($(ADK_PACKAGE_OPENVPN_WITH_LZO),)
CONFIGURE_ARGS+=	--enable-lzo
else
CONFIGURE_ARGS+=	--disable-lzo
endif

ifneq ($(ADK_PACKAGE_OPENVPN_WITH_MANAGEMENT),)
CONFIGURE_ARGS+=	--enable-management
else
CONFIGURE_ARGS+=	--disable-management
endif

ifneq ($(ADK_PACKAGE_OPENVPN_WITH_HTTPPROXY),)
CONFIGURE_ARGS+=	--enable-http
else
CONFIGURE_ARGS+=	--disable-http
endif

ifneq ($(ADK_PACKAGE_OPENVPN_WITH_SOCKS),)
CONFIGURE_ARGS+=	--enable-socks
else
CONFIGURE_ARGS+=	--disable-socks
endif

CONFIGURE_ARGS+=	--disable-pthread \
			--disable-plugins \
			--enable-small \
			--enable-iproute2 \
			--with-iproute-path=/usr/sbin/ip \
			--without-ifconfig-path \
			--without-route-path

post-install:
	${INSTALL_DIR} $(IDIR_OPENVPN)/usr/sbin $(IDIR_OPENVPN)/etc/openvpn
	${INSTALL_BIN} $(WRKINST)/usr/sbin/openvpn $(IDIR_OPENVPN)/usr/sbin/
ifeq ($(ADK_PACKAGE_OPENVPN_SERVER),y)
	$(CP) ./files/server.conf $(IDIR_OPENVPN)/etc/openvpn/
	echo "/etc/openvpn/server.conf" > ./files/openvpn.conffiles
endif
ifeq ($(ADK_PACKAGE_OPENVPN_CLIENT),y)
	$(CP) ./files/client.conf $(IDIR_OPENVPN)/etc/openvpn/
	echo "/etc/openvpn/client.conf" > ./files/openvpn.conffiles
endif

openvpn-easy-rsa-install:
	${INSTALL_DIR} $(IDIR_OPENVPN_EASY_RSA)/usr/sbin \
		$(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys
	touch $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys/index.txt
	$(CP) ./files/serial $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys
	$(CP) $(WRKBUILD)/easy-rsa/2.0/{build-*,clean-all,inherit-inter,list-crl,pkitool,revoke-full,sign-req,whichopensslcnf} \
		$(IDIR_OPENVPN_EASY_RSA)/usr/sbin
	${INSTALL_DATA} $(WRKBUILD)/easy-rsa/2.0/openssl-1.0.0.cnf \
		$(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/openssl.cnf
	${INSTALL_DATA} $(WRKBUILD)/easy-rsa/2.0/vars \
		$(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/vars

include ${TOPDIR}/mk/pkg-bottom.mk
