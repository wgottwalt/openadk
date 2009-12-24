# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		curl
PKG_VERSION:=		7.19.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		ecb2e37e45c9933e2a963cabe03670ab
PKG_DESCR:=		a client-side URL transfer tool
PKG_SECTION:=		net
PKG_DEPENDS:=		libcurl
PKG_BUILDDEP+=		openssl zlib
PKG_URL:=		http://curl.haxx.se
PKG_SITES:=		http://curl.haxx.se/download/ \
			http://www.mirrorspace.org/curl/ \
			http://curl.mirror.internet.tp/download/ \
			ftp://ftp.sunet.se/pub/www/utilities/curl/ \
			ftp://ftp.planetmirror.com/pub/curl/ \
			http://www.mirrormonster.com/curl/download/ \
			http://curl.mirrors.cyberservers.net/download/

PKG_DESCR_LIB:=		a client-side URL transfer library
PKG_SECTION_LIB:=	libs
PKG_DEPENDS_LIB:=	libopenssl zlib
PKG_DESCR_LIB_DEV:=	development files for libcurl
PKG_SECTION_LIB_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CURL,curl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBCURL,libcurl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_LIB},${PKG_DESCR_LIB},${PKG_SECTION_LIB}))
$(eval $(call PKG_template,LIBCURL_DEV,libcurl-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_LIB_DEV},${PKG_SECTION_LIB_DEV}))

CONFIGURE_STYLE:=	gnu
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
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_CURL}/usr/bin ${IDIR_LIBCURL}/usr/lib
	${CP} ${WRKINST}/usr/bin/curl ${IDIR_CURL}/usr/bin/
	${CP} ${WRKINST}/usr/lib/libcurl.so* ${IDIR_LIBCURL}/usr/lib/
	${INSTALL_DIR} ${IDIR_LIBCURL_DEV}/usr/include/curl
	${CP} ${WRKINST}/usr/include/curl/*.h ${IDIR_LIBCURL_DEV}/usr/include/curl/

include ${TOPDIR}/mk/pkg-bottom.mk
