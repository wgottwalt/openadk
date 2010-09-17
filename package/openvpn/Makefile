# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openvpn
PKG_VERSION:=		2.1.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		b273ed2b5ec8616fb9834cde8634bce7
PKG_DESCR:=		Open Source VPN solution using SSL
PKG_SECTION:=		net/security
PKG_DEPENDS:=		kmod-tun libopenssl
PKG_BUILDDEP:=		openssl
PKG_URL:=		http://openvpn.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=openvpn/}

PKG_SUBPKGS:=		OPENVPN OPENVPN_EASY_RSA
PKG_FLAVOURS:=		WITH_LZO WITH_MANAGEMENT WITH_HTTPPROXY WITH_SOCKS
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
			--with-iproute-path=ip \
			--without-ifconfig-path \
			--without-route-path

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${OPENVPN_EASY_RSA}+=	openvpn-easy-rsa-install

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} $(IDIR_OPENVPN)/usr/sbin $(IDIR_OPENVPN)/etc/openvpn
	${INSTALL_BIN} $(WRKINST)/usr/sbin/openvpn $(IDIR_OPENVPN)/usr/sbin/
	$(CP) ./files/openvpn.conf $(IDIR_OPENVPN)/etc/openvpn/

openvpn-easy-rsa-install:
	${INSTALL_DIR} $(IDIR_OPENVPN_EASY_RSA)/usr/sbin \
		$(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys
	touch $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys/index.txt
	$(CP) ./files/serial $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys
	$(CP) $(WRKBUILD)/easy-rsa/2.0/{build-*,clean-all,inherit-inter,list-crl,pkitool,revoke-full,sign-req,whichopensslcnf} \
		$(IDIR_OPENVPN_EASY_RSA)/usr/sbin
	${INSTALL_DATA} $(WRKBUILD)/easy-rsa/2.0/openssl.cnf \
		$(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/openssl.cnf
	${INSTALL_DATA} $(WRKBUILD)/easy-rsa/2.0/vars \
		$(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/vars

include ${TOPDIR}/mk/pkg-bottom.mk
