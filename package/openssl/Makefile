# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openssl
PKG_VERSION:=		0.9.8j
PKG_RELEASE:=		1
PKG_MD5SUM:=		a5cb5f6c3d11affb387ecf7a997cac0c
PKG_DESCR:=		OpenSSL (Secure Socket Layer) libraries
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_URL:=		http://www.openssl.org
PKG_SITES:=		http://www.openssl.org/source/ \
			ftp://ftp.funet.fi/pub/crypt/cryptography/libs/openssl/source/ \
			ftp://ftp.webmonster.de/pub/openssl/source/ \
			ftp://ftp.sunet.se/pub/security/tools/net/openssl/source/

PKG_DESCR_UTIL:=	OpenSSL (Secure Socket Layer) command line tool
PKG_SECTION_UTIL:=	admin
PKG_DEPENDS_UTIL:=	libopenssl
PKG_DEPENDS_DEV:=	libopenssl

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOPENSSL,libopenssl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBOPENSSL_DEV,libopenssl-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_DEV},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,OPENSSL_UTIL,openssl-util,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_UTIL},${PKG_DESCR_UTIL},${PKG_SECTION_UTIL}))

BUILD_STYLE:=		manual
INSTALL_STYLE:=		auto
INSTALL_TARGET:=	install_sw
FAKE_FLAGS+=		INSTALL_PREFIX=${WRKINST}

OPENSSL_OPTIONS = shared no-ec no-err no-hw no-krb5 no-threads zlib-dynamic no-engines no-camellia no-idea no-rc5 no-mdc2 no-sha0 no-smime no-aes192 no-ripemd no-cast no-bf

do-configure:
	(cd $(WRKBUILD); \
		PATH=$(TARGET_PATH) \
		OPTIMIZATION_FLAGS="$(TARGET_CFLAGS) -fPIC" \
		./Configure linux-embedded \
		  --prefix=/usr \
		  --openssldir=/etc/ssl \
		  --with-cryptodev \
		  -I$(STAGING_DIR)/usr/include \
		  -L$(STAGING_DIR)/usr/lib -ldl \
		  -DOPENSSL_SMALL_FOOTPRINT \
		  $(OPENSSL_OPTIONS) \
	);

do-build:
	$(MAKE) -C $(WRKBUILD) \
		MAKEDEPPROG="$(TARGET_CC)" \
		OPTIMIZATION_FLAGS="$(TARGET_CFLAGS) -fPIC" \
		depend
	$(MAKE) -C $(WRKBUILD) \
		CC="$(TARGET_CC)" \
		AR="$(TARGET_CROSS)ar r" \
		RANLIB="$(TARGET_CROSS)ranlib" \
		OPTIMIZATION_FLAGS="$(TARGET_CFLAGS) -fPIC" \
		all build-shared

post-install:
	${INSTALL_DIR} ${IDIR_LIBOPENSSL}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib*.so* ${IDIR_LIBOPENSSL}/usr/lib
	chmod 644 ${IDIR_LIBOPENSSL}/usr/lib/lib*.so*
	${INSTALL_DIR} ${IDIR_OPENSSL_UTIL}/usr/bin
	${CP} ${WRKINST}/usr/bin/openssl ${IDIR_OPENSSL_UTIL}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENSSL_UTIL}/etc/ssl/{,certs,private}
	${CP} ${WRKSRC}/apps/openssl.cnf ${IDIR_OPENSSL_UTIL}/etc/ssl/
	chmod 0700 ${IDIR_OPENSSL_UTIL}/etc/ssl/private
	${INSTALL_DIR} ${IDIR_LIBOPENSSL_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBOPENSSL_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
