# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openssl
PKG_VERSION:=		1.0.1c
PKG_RELEASE:=		4
PKG_MD5SUM:=		ae412727c8c15b67880aef7bd2999b2e
PKG_DESCR:=		OpenSSL (Secure Socket Layer) libraries
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.openssl.org/
PKG_SITES:=		http://www.openssl.org/source/

PKG_SUBPKGS:=		LIBOPENSSL LIBOPENSSL_DEV OPENSSL_UTIL
PKGSD_OPENSSL_UTIL:=	OpenSSL command line tool
PKGSC_OPENSSL_UTIL:=	crypto
PKGSS_OPENSSL_UTIL:=	libopenssl
PKGSD_LIBOPENSSL_DEV:=	development files for openssl
PKGSC_LIBOPENSSL_DEV:=	devel
PKGSS_LIBOPENSSL_DEV:=	libopenssl

PKG_FLAVOURS_LIBOPENSSL:=	WITH_EC WITH_CRYPTODEV
PKGFD_WITH_EC:=			enable Elliptic Curve crypto
PKGFD_WITH_CRYPTODEV:=		enable support for cryptodev-linux

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOPENSSL,libopenssl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},$(PKG_OPTS)))
$(eval $(call PKG_template,LIBOPENSSL_DEV,libopenssl-dev,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBOPENSSL_DEV},${PKGSD_LIBOPENSSL_DEV},${PKGSC_LIBOPENSSL_DEV}))
$(eval $(call PKG_template,OPENSSL_UTIL,openssl-util,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_OPENSSL_UTIL},${PKGSD_OPENSSL_UTIL},${PKGSC_OPENSSL_UTIL}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual

INSTALL_TARGET:=	install_sw
FAKE_FLAGS+=		INSTALL_PREFIX=${WRKINST}

OPENSSL_OPTIONS:= shared no-err no-krb5 no-threads zlib-dynamic no-engines no-camellia no-idea no-rc5 no-mdc2 no-sha0 no-smime no-aes192 no-ripemd no-cast

ifeq ($(ADK_PACKAGE_LIBOPENSSL_WITH_EC),)
OPENSSL_OPTIONS+= no-ec
endif

ifneq ($(ADK_PACKAGE_LIBOPENSSL_WITH_CRYPTODEV),)
OPENSSL_OPTIONS+= -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
endif

ifeq ($(ADK_LINUX_X86_64),y)
CONFIG:=	linux-embedded-x86_64
else
CONFIG:=	linux-embedded
endif

post-extract:
	-mkdir -p $(STAGING_DIR)/usr/include/crypto
	cp ./files/cryptodev.h $(STAGING_DIR)/usr/include/crypto/

do-configure:
	(cd $(WRKBUILD); \
		PATH=$(TARGET_PATH) \
		OPTIMIZATION_FLAGS="$(TARGET_CFLAGS) -fPIC" \
		./Configure $(CONFIG) \
		  --prefix=/usr \
		  --openssldir=/etc/ssl \
		  -I$(STAGING_TARGET_DIR)/usr/include \
		  -L$(STAGING_TARGET_DIR)/usr/lib -ldl \
		  -DOPENSSL_SMALL_FOOTPRINT \
		  $(OPENSSL_OPTIONS) \
	);

do-build:
	$(MAKE) -C $(WRKBUILD) \
		CC="$(TARGET_CC)" \
		AR="$(TARGET_CROSS)ar r" \
		RANLIB="$(TARGET_CROSS)ranlib" \
		OPTIMIZATION_FLAGS="$(TARGET_CFLAGS) -fPIC" \
		all build-shared

post-install:
	${INSTALL_DIR} ${IDIR_LIBOPENSSL}/usr/lib
	${CP} ${WRKINST}/usr/lib*/lib*.so* ${IDIR_LIBOPENSSL}/usr/lib
	chmod 644 ${IDIR_LIBOPENSSL}/usr/lib/lib*.so*

openssl-util-install:
	${INSTALL_DIR} ${IDIR_OPENSSL_UTIL}/usr/bin
	${CP} ${WRKINST}/usr/bin/openssl ${IDIR_OPENSSL_UTIL}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENSSL_UTIL}/etc/ssl/{,certs,private}
	${CP} ${WRKSRC}/apps/openssl.cnf ${IDIR_OPENSSL_UTIL}/etc/ssl/
	chmod 0700 ${IDIR_OPENSSL_UTIL}/etc/ssl/private

libopenssl-dev-install:
	${INSTALL_DIR} ${IDIR_LIBOPENSSL_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBOPENSSL_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
