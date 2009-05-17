# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		curl
PKG_VERSION:=		7.19.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		35f51ac7bcff689b2d2d6e38a3c4d1ae
MASTER_SITES:=		http://curl.haxx.se/download/ \
			http://www.mirrorspace.org/curl/ \
			http://curl.mirror.internet.tp/download/ \
			ftp://ftp.sunet.se/pub/www/utilities/curl/ \
			ftp://ftp.planetmirror.com/pub/curl/ \
			http://www.mirrormonster.com/curl/download/ \
			http://curl.mirrors.cyberservers.net/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CURL,curl,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,LIBCURL,libcurl,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
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
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_CURL}/usr/bin
	${CP} ${WRKINST}/usr/bin/curl ${IDIR_CURL}/usr/bin/
	${INSTALL_DIR} ${IDIR_LIBCURL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcurl.so.* ${IDIR_LIBCURL}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
