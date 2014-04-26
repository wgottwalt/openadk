# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openvpn
PKG_VERSION:=		2.3.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		547a024ac81acf458edeb19f32cf1088
PKG_DESCR:=		VPN solution using SSL/TLS
PKG_SECTION:=		net/security
PKG_BUILDDEP:=		autotool
PKG_DEPENDS:=		kmod-tun ip
PKG_URL:=		http://openvpn.net/
PKG_SITES:=		http://swupdate.openvpn.org/community/releases/

PKG_FLAVOURS_OPENVPN:=	WITH_LZO WITH_MANAGEMENT WITH_HTTPPROXY WITH_SOCKS
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

$(eval $(call PKG_template,OPENVPN,openvpn,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf

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

openvpn-install:
	${INSTALL_DIR} $(IDIR_OPENVPN)/usr/sbin $(IDIR_OPENVPN)/etc/openvpn
	${INSTALL_BIN} $(WRKINST)/usr/sbin/openvpn $(IDIR_OPENVPN)/usr/sbin/
	$(CP) ./files/server.conf $(IDIR_OPENVPN)/etc/openvpn/server.conf.example
	$(CP) ./files/client.conf $(IDIR_OPENVPN)/etc/openvpn/client.conf.example

include ${TOPDIR}/mk/pkg-bottom.mk
