# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openvpn
PKG_VERSION:=		2.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		06e5f93dbf13f2c19647ca15ffc23ac1
PKG_DESCR:=		Open Source VPN solution using SSL
PKG_SECTION:=		net/security
PKG_DEPENDS:=		kmod-tun ip
PKG_URL:=		http://openvpn.net/
PKG_SITES:=		http://swupdate.openvpn.org/community/releases/

PKG_SUBPKGS:=		OPENVPN
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

PKG_CHOICES_OPENVPN:=		WITH_OPENSSL WITH_POLARSSL
PKGCD_WITH_OPENSSL:=		use OpenSSL for crypto
PKGCS_WITH_OPENSSL:=		libopenssl
PKGCB_WITH_OPENSSL:=		openssl
PKGCD_WITH_POLARSSL:=		use PolarSSL for crypto
PKGCS_WITH_POLARSSL:=		libpolarssl
PKGCB_WITH_POLARSSL:=		polarssl

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPENVPN,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

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
CONFIGURE_ARGS+=	--enable-http-proxy
else
CONFIGURE_ARGS+=	--disable-http-proxy
endif

ifneq ($(ADK_PACKAGE_OPENVPN_WITH_SOCKS),)
CONFIGURE_ARGS+=	--enable-socks
else
CONFIGURE_ARGS+=	--disable-socks
endif

ifeq (${ADK_PACKAGE_OPENVPN_WITH_OPENSSL},y)
CONFIGURE_ARGS+=	--with-crypto-library=openssl
endif
ifeq (${ADK_PACKAGE_OPENVPN_WITH_POLARSSL},y)
CONFIGURE_ARGS+=	--with-crypto-library=polarssl
endif

CONFIGURE_ARGS+=	--disable-plugins \
			--enable-small \
			--disable-debug \
			--enable-iproute2

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

include ${TOPDIR}/mk/pkg-bottom.mk
