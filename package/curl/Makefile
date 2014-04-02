# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		curl
PKG_VERSION:=		7.28.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		cbdc0a79bdf6e657dd387c3d88d802e3
PKG_DESCR:=		a client-side URL transfer tool
PKG_SECTION:=		www
PKG_DEPENDS:=		libcurl
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://curl.haxx.se/
PKG_SITES:=		http://curl.haxx.se/download/
PKG_LIBNAME:=		libcurl
PKG_OPTS:=		dev

PKG_SUBPKGS:=		CURL LIBCURL
PKGSD_LIBCURL:=		a client-side URL transfer library
PKGSC_LIBCURL:=		libs
PKGSS_LIBCURL:=		zlib

PKG_FLAVOURS_CURL:=	WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

PKG_CHOICES_LIBCURL:=	WITH_GNUTLS WITH_OPENSSL WITHOUT_SSL
PKGCD_WITHOUT_SSL:=	use no SSL
PKGCD_WITH_OPENSSL:=	use OpenSSL for crypto
PKGCS_WITH_OPENSSL:=	libopenssl ca-certificates libgmp
PKGCB_WITH_OPENSSL:=	openssl
PKGCD_WITH_GNUTLS:=	use GnuTLS for crypto
PKGCS_WITH_GNUTLS:=	libgnutls ca-certificates libgmp
PKGCB_WITH_GNUTLS:=	gnutls

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libmix
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CURL,curl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBCURL,libcurl,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBCURL},${PKGSD_LIBCURL},${PKGSC_LIBCURL},${PKG_OPTS}))

ifeq (${ADK_PACKAGE_LIBCURL_WITHOUT_SSL},y)
CONFIGURE_ARGS+=	--without-ssl \
			--without-gnutls \
			--without-axtls
endif
ifeq (${ADK_PACKAGE_LIBCURL_WITH_OPENSSL},y)
CONFIGURE_ARGS+=	--with-ssl="${STAGING_TARGET_DIR}/usr" \
			--without-gnutls \
			--without-axtls
endif
ifeq (${ADK_PACKAGE_LIBCURL_WITH_GNUTLS},y)
CONFIGURE_ARGS+=	--with-gnutls="${STAGING_TARGET_DIR}/usr" \
			--without-ssl \
			--without-axtls
endif

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ENV+=		curl_typeof_curl_socklen_t=socklen_t
CONFIGURE_ARGS+=	--disable-thread \
			--enable-cookies \
			--enable-crypto-auth \
			--enable-nonblocking \
			--enable-file \
			--enable-ftp \
			--enable-http \
			--disable-ares \
			--disable-dict \
			--disable-gopher \
			--disable-ldap \
			--disable-manual \
			--disable-sspi \
			--disable-telnet \
			--disable-verbose \
			--with-random="/dev/urandom" \
			--with-ca-bundle="/etc/ssl/cert.pem" \
			--without-libidn

ifneq (${ADK_PACKAGE_CURL_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

curl-install:
	${INSTALL_DIR} ${IDIR_CURL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/curl ${IDIR_CURL}/usr/bin

libcurl-install:
	${INSTALL_DIR} ${IDIR_LIBCURL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcurl.so* ${IDIR_LIBCURL}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
