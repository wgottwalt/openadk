# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		openssl
PKG_VERSION:=		1.0.2c
PKG_RELEASE:=		2
PKG_HASH:=		0038ba37f35a6367c58f17a7a7f687953ef8ce4f9684bbdec63e62515ed36a83
PKG_DESCR:=		secure socket layer libraries
PKG_SECTION:=		libs/crypto
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.openssl.org/
PKG_SITES:=		http://www.openssl.org/source/
PKG_LIBNAME:=		libopenssl
PKG_OPTS:=		dev
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		LIBOPENSSL OPENSSL_UTIL
PKGSD_OPENSSL_UTIL:=	openssl command line tool
PKGSC_OPENSSL_UTIL:=	app/crypto
PKGSS_OPENSSL_UTIL:=	libopenssl

PKG_FLAVOURS_LIBOPENSSL:=	WITH_CRYPTODEV
PKGFD_WITH_CRYPTODEV:=		enable support for cryptodev-linux

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,OPENSSL,openssl,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBOPENSSL,libopenssl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},$(PKG_OPTS)))
$(eval $(call PKG_template,OPENSSL_UTIL,openssl-util,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_OPENSSL_UTIL},${PKGSD_OPENSSL_UTIL},${PKGSC_OPENSSL_UTIL}))

ifeq ($(ADK_TARGET_USE_STATIC_LIBS),y)
OPENSSL_OPTIONS:=	no-shared zlib no-dso
else
OPENSSL_OPTIONS:=	shared zlib-dynamic
ALL_TARGET+=		build-shared
TARGET_CFLAGS+=		-ldl
endif

OPENSSL_OPTIONS+= threads no-err no-krb5 no-engines no-camellia no-idea no-rc5 no-mdc2 no-sha0 no-smime no-aes192 no-cast

HOST_STYLE:=		manual
CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual

INSTALL_TARGET:=	install_sw
FAKE_FLAGS+=		INSTALL_PREFIX=${WRKINST}

ifneq ($(ADK_PACKAGE_LIBOPENSSL_WITH_CRYPTODEV),)
OPENSSL_OPTIONS+= -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
endif

ifeq ($(ADK_TARGET_ARCH_MICROBLAZE),y)
TARGET_CFLAGS:=		$(subst g3,g,$(TARGET_CFLAGS))
endif
ifeq ($(ADK_TARGET_ARCH_XTENSA),y)
TARGET_CFLAGS:=		$(subst g3,g,$(TARGET_CFLAGS))
endif
ifeq ($(ADK_TARGET_ARCH_PPC),y)
TARGET_CFLAGS:=		$(subst g3,g,$(TARGET_CFLAGS))
endif

CONFIG:=		linux-generic32
ifeq ($(ADK_TARGET_ARCH_X86_64),y)
CONFIG:=		linux-x86_64
endif

ifneq (,$(filter CYGWIN%,${OStype}))
HOSTCONFIG:=		Cygwin-x86_64
endif
ifeq ($(OStype),Darwin)
HOSTCONFIG:=		darwin64-x86_64-cc
endif

host-configure:
ifeq ($(HOSTCONFIG),)
	(cd $(WRKBUILD); ./config --prefix='$(STAGING_HOST_DIR)/usr' -fPIC -ldl)
else
	(cd $(WRKBUILD); ./Configure $(HOSTCONFIG) --prefix='$(STAGING_HOST_DIR)/usr')
endif

host-build:
	(cd $(WRKBUILD); make)

openssl-hostinstall:
	(cd $(WRKBUILD); make install)

post-extract:
	-mkdir -p $(STAGING_TARGET_DIR)/usr/include/crypto
	$(CP) ./files/cryptodev.h $(STAGING_TARGET_DIR)/usr/include/crypto/

do-configure:
	(cd $(WRKBUILD); \
		PATH='$(TARGET_PATH)' \
		./Configure $(CONFIG) \
		  --prefix=/usr \
		  --openssldir=/etc/ssl \
		  -I$(STAGING_TARGET_DIR)/usr/include \
		  -L$(STAGING_TARGET_DIR)/usr/lib \
		  -DOPENSSL_SMALL_FOOTPRINT \
		  $(OPENSSL_OPTIONS) \
	);
	$(SED) "s:-O[0-9]:$(TARGET_CFLAGS) -fPIC:" $(WRKBUILD)/Makefile

do-build:
	$(MAKE) -C $(WRKBUILD) \
		CC="$(TARGET_CC)" \
		AR="$(TARGET_CROSS)ar r" \
		RANLIB="$(TARGET_CROSS)ranlib" \
		$(ALL_TARGET)

libopenssl-install:
	${INSTALL_DIR} ${IDIR_LIBOPENSSL}/usr/lib
	${CP} ${WRKINST}/usr/lib*/lib*.so* ${IDIR_LIBOPENSSL}/usr/lib
	chmod 644 ${IDIR_LIBOPENSSL}/usr/lib/lib*.so*

openssl-util-install:
	${INSTALL_DIR} ${IDIR_OPENSSL_UTIL}/usr/bin
	${CP} ${WRKINST}/usr/bin/openssl ${IDIR_OPENSSL_UTIL}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENSSL_UTIL}/etc/ssl/{,certs,private}
	${CP} ${WRKSRC}/apps/openssl.cnf ${IDIR_OPENSSL_UTIL}/etc/ssl/
	chmod 0700 ${IDIR_OPENSSL_UTIL}/etc/ssl/private

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
