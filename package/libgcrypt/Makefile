# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libgcrypt
PKG_VERSION:=		1.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		555488ddfc81a6e0df1fb5112e7eee13
PKG_DESCR:=		GNU crypto library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libgpg-error
PKG_URL:=		http://directory.fsf.org/project/libgcrypt
PKG_SITES:=		ftp://ftp.gnupg.org/gcrypt/libgcrypt/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGCRYPT,libgcrypt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-asm \
			--with-gpg-error-prefix="${STAGING_DIR}/usr"
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBGCRYPT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgcrypt.so.* ${IDIR_LIBGCRYPT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
