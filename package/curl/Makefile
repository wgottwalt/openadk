# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		curl
PKG_VERSION:=		7.21.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		6dfb911a254a1b5ca8b534b98f2196aa
PKG_DESCR:=		a client-side URL transfer tool
PKG_SECTION:=		www
PKG_DEPENDS:=		libcurl
PKG_BUILDDEP:=		openssl zlib
PKG_URL:=		http://curl.haxx.se/
PKG_SITES:=		http://curl.haxx.se/download/

PKG_SUBPKGS:=		CURL LIBCURL LIBCURL_DEV
PKGSD_LIBCURL:=		a client-side URL transfer library
PKGSC_LIBCURL:=		libs
PKGSS_LIBCURL:=		libopenssl zlib
PKGSD_LIBCURL_DEV:=	development files for libcurl
PKGSC_LIBCURL_DEV:=	devel

PKG_FLAVOURS:=		WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CURL,curl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBCURL,libcurl,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBCURL},${PKGSD_LIBCURL},${PKGSC_LIBCURL}))
$(eval $(call PKG_template,LIBCURL_DEV,libcurl-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBCURL_DEV},${PKGSC_LIBCURL_DEV}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_CURL}+=		curl-install
SUB_INSTALLS-${ADK_PACKAGE_LIBCURL_DEV}+=	libcurl-dev-install

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
			--with-ssl="${STAGING_DIR}/usr" \
			--without-ca-bundle \
			--without-gnutls \
			--without-libidn

ifneq (${ADK_PACKAGE_CURL_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_LIBCURL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcurl.so* ${IDIR_LIBCURL}/usr/lib/

curl-install:
	${INSTALL_DIR} ${IDIR_CURL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/curl ${IDIR_CURL}/usr/bin/

libcurl-dev-install:
	${INSTALL_DIR} ${IDIR_LIBCURL_DEV}/usr/include/curl
	${CP} ${WRKINST}/usr/include/curl/*.h \
		${IDIR_LIBCURL_DEV}/usr/include/curl/

include ${TOPDIR}/mk/pkg-bottom.mk
