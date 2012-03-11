# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		curl
PKG_VERSION:=		7.24.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		b93420f80a2baaa61a0f45214eddc2ba
PKG_DESCR:=		a client-side URL transfer tool
PKG_SECTION:=		www
PKG_DEPENDS:=		libcurl
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://curl.haxx.se/
PKG_SITES:=		http://curl.haxx.se/download/

PKG_SUBPKGS:=		CURL LIBCURL LIBCURL_DEV
PKGSD_LIBCURL:=		a client-side URL transfer library
PKGSC_LIBCURL:=		libs
PKGSS_LIBCURL:=		zlib
PKGSD_LIBCURL_DEV:=	development files for libcurl
PKGSC_LIBCURL_DEV:=	devel

PKG_FLAVOURS_CURL:=	WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

PKG_CHOICES_CURL:=	WITHOUT_SSL WITH_OPENSSL WITH_GNUTLS
PKGCD_WITHOUT_SSL:=	use no SSL
PKGCD_WITH_OPENSSL:=	use OpenSSL for crypto
PKGCS_WITH_OPENSSL:=	libopenssl ca-certificates
PKGCB_WITH_OPENSSL:=	openssl
PKGCD_WITH_GNUTLS:=	use GnuTLS for crypto
PKGCS_WITH_GNUTLS:=	libgnutls ca-certificates
PKGCB_WITH_GNUTLS:=	gnutls

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CURL,curl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBCURL,libcurl,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBCURL},${PKGSD_LIBCURL},${PKGSC_LIBCURL}))
$(eval $(call PKG_template,LIBCURL_DEV,libcurl-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBCURL_DEV},${PKGSC_LIBCURL_DEV}))

ifeq (${ADK_PACKAGE_CURL_WITHOUT_SSL},y)
CONFIGURE_ARGS+=	--without-ssl \
			--without-gnutls
endif
ifeq (${ADK_PACKAGE_CURL_WITH_OPENSSL},y)
CONFIGURE_ARGS+=	--with-ssl="${STAGING_TARGET_DIR}/usr" \
			--without-gnutls
endif
ifeq (${ADK_PACKAGE_CURL_WITH_GNUTLS},y)
CONFIGURE_ARGS+=	--with-gnutls="${STAGING_TARGET_DIR}/usr" \
			--without-ssl
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

libcurl-dev-install:
	${INSTALL_DIR} ${IDIR_LIBCURL_DEV}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcurl.a ${IDIR_LIBCURL_DEV}/usr/lib
	${INSTALL_DIR} ${IDIR_LIBCURL_DEV}/usr/include/curl
	${CP} ${WRKINST}/usr/include/curl/*.h \
		${IDIR_LIBCURL_DEV}/usr/include/curl
	${INSTALL_DIR} ${IDIR_LIBCURL_DEV}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/curl-config \
		${IDIR_LIBCURL_DEV}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
