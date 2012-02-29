# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libgcrypt
PKG_VERSION:=		1.5.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		78f8f8bec4580f75b25816f7896d0389
PKG_DESCR:=		GNU crypto library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libgpg-error
PKG_BUILDDEP:=		libgpg-error
PKG_URL:=		http://directory.fsf.org/project/libgcrypt
PKG_SITES:=		ftp://ftp.gnupg.org/gcrypt/libgcrypt/

PKG_SUBPKGS:=		LIBGCRYPT LIBGCRYPT_DEV
PKGSD_LIBGCRYPT_DEV:=	GNU crypto headers
PKGSC_LIBGCRYPT_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGCRYPT,libgcrypt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBGCRYPT_DEV,libgcrypt-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBGCRYPT_DEV},${PKGSC_LIBGCRYPT_DEV}))

CONFIGURE_ARGS+=	--disable-asm \
			--with-gpg-error-prefix="${STAGING_TARGET_DIR}/usr"

libgcrypt-install:
	${INSTALL_DIR} ${IDIR_LIBGCRYPT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgcrypt.so* \
		${IDIR_LIBGCRYPT}/usr/lib

libgcrypt-dev-install:
	${INSTALL_DIR} ${IDIR_LIBGCRYPT_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* \
		${IDIR_LIBGCRYPT_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBGCRYPT_DEV}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/libgcrypt-config \
		${IDIR_LIBGCRYPT_DEV}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
