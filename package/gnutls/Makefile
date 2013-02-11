# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gnutls
PKG_VERSION:=		3.0.21
PKG_RELEASE:=		2
PKG_MD5SUM:=		7480dff7115e5af85215893c06b3ac5c
PKG_DESCR:=		GNU TLS library
PKG_SECTION:=		crypto
PKG_DEPENDS:=		libgcrypt libtasn1 zlib libnettle libgmp
PKG_BUILDDEP:=		libgcrypt liblzo libtasn1 zlib ncurses libnettle
PKG_URL:=		http://www.gnu.org/software/gnutls/
PKG_SITES:=		${MASTER_SITE_GNU:=gnutls/}

PKG_SUBPKGS:=		LIBGNUTLS GNUTLS_UTILS LIBGNUTLS_EXTRA LIBGNUTLS_OPENSSL
PKGSD_GNUTLS_UTILS:=	GNU TLS utilities
PKGSS_GNUTLS_UTILS:=	libgnutls libgnutls-extra
PKGSC_GNUTLS_UTILS:=	crypto
PKGSC_LIBGNUTLS:=	libs
PKGSC_LIBGNUTLS_EXTRA:=	libs
PKGSC_LIBGNUTLS_OPENSSL:=	libs

PKG_FLAVOURS_LIBGNUTLS:=	WITH_CRYPTODEV
PKGFD_WITH_CRYPTODEV:=		enable support for cryptodev-linux
PKGFB_WITH_CRYPTODEV:=		cryptodev-linux

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGNUTLS,libgnutls,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKGSC_LIBGNUTLS}))
$(eval $(call PKG_template,GNUTLS_UTILS,gnutls-utils,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_GNUTLS_UTILS},${PKGSD_GNUTLS_UTILS},${PKGSC_GNUTLS_UTILS}))
$(eval $(call PKG_template,LIBGNUTLS_EXTRA,libgnutls-extra,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKGSC_LIBGNUTLS_EXTRA}))
$(eval $(call PKG_template,LIBGNUTLS_OPENSSL,libgnutls-openssl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKGSC_LIBGNUTLS_OPENSSL}))

ifneq ($(ADK_PACKAGE_LIBGNUTLS_WITH_CRYPTODEV),)
CONFIGURE_ARGS+= 	--enable-cryptodev
endif

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
TARGET_LDFLAGS+=	-pthread -L$(STAGING_DIR)/usr/lib64
CONFIGURE_ARGS+=	--disable-rpath \
			--without-libz-prefix \
			--without-p11-kit \
			--with-libnettle-prefix="$(STAGING_DIR)/usr"
CONFIGURE_ENV+=		ac_cv_prog_AR='$(TARGET_CROSS)ar'

post-install:
	${INSTALL_DIR} ${IDIR_LIBGNUTLS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgnutls.so* ${IDIR_LIBGNUTLS}/usr/lib
	${INSTALL_DIR} ${IDIR_LIBGNUTLS_EXTRA}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgnutlsxx.so* \
		${IDIR_LIBGNUTLS_EXTRA}/usr/lib
	${INSTALL_DIR} ${IDIR_LIBGNUTLS_OPENSSL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgnutls-openssl.so* \
		${IDIR_LIBGNUTLS_OPENSSL}/usr/lib
	${INSTALL_DIR} ${IDIR_GNUTLS_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/{{cert,srp,psk}tool,gnutls-{cli,serv}} \
	    ${IDIR_GNUTLS_UTILS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
