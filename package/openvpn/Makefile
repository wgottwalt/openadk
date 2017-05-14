# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		openvpn
PKG_VERSION:=		2.4.2
PKG_RELEASE:=		1
PKG_HASH:=		df5c4f384b7df6b08a2f6fa8a84b9fd382baf59c2cef1836f82e2a7f62f1bff9
PKG_DESCR:=		vpn solution using ssl/tls
PKG_DEPENDS:=		libressl
PKG_BUILDDEP:=		libressl
PKG_KDEPENDS:=		tun
PKG_SECTION:=		net/security
PKG_URL:=		http://openvpn.net/
PKG_SITES:=		http://swupdate.openvpn.org/community/releases/

PKG_FLAVOURS_OPENVPN:=	WITH_LZO WITH_LZ4 WITH_MANAGEMENT WITH_HTTPPROXY WITH_SOCKS WITH_SMALL
PKGFD_WITH_LZO:=	enable lzo compression support
PKGFS_WITH_LZO:=	liblzo
PKGFB_WITH_LZO:=	liblzo
PKGFD_WITH_LZ4:=	enable lz4 compression support
PKGFS_WITH_LZ4:=	liblz4
PKGFB_WITH_LZ4:=	lz4
PKGFD_WITH_MANAGEMENT:=	enable management server support
PKGFD_WITH_HTTPPROXY:=	enable http proxy support
PKGFD_WITH_SOCKS:=	enable socks proxy support
PKGFD_WITH_SMALL:=	enable extra small binary

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPENVPN,openvpn,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_lib_nsl_inet_ntoa=no

ifneq ($(ADK_PACKAGE_OPENVPN_WITH_LZ4),)
CONFIGURE_ARGS+=	--enable-lz4
else
CONFIGURE_ARGS+=	--disable-lz4
endif

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

ifneq ($(ADK_PACKAGE_OPENVPN_WITH_SMALL),)
CONFIGURE_ARGS+=	--enable-small
endif

ifeq ($(ADK_DEBUG),y)
CONFIGURE_ARGS+=	--enable-debug
else
CONFIGURE_ARGS+=	--disable-debug
endif

CONFIGURE_ARGS+=	--disable-plugins \
			--with-crypto-library=openssl \
			--enable-iproute2

openvpn-install:
	${INSTALL_DIR} $(IDIR_OPENVPN)/usr/sbin $(IDIR_OPENVPN)/etc/openvpn
	${INSTALL_BIN} $(WRKINST)/usr/sbin/openvpn $(IDIR_OPENVPN)/usr/sbin/
	$(CP) ./files/server.conf $(IDIR_OPENVPN)/etc/openvpn/server.conf.example
	$(CP) ./files/client.conf $(IDIR_OPENVPN)/etc/openvpn/client.conf.example

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
