# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libgcrypt
PKG_VERSION:=		1.6.1
PKG_RELEASE:=		1
PKG_HASH:=		7c1007197bef49c3b8740cf6af8b4eb4eb74c7a69796ebcf555d928c287255de
PKG_DESCR:=		crypto library
PKG_SECTION:=		libs/crypto
PKG_DEPENDS:=		libgpg-error
PKG_BUILDDEP:=		libgpg-error
PKG_URL:=		http://directory.fsf.org/project/libgcrypt
PKG_SITES:=		ftp://ftp.gnupg.org/gcrypt/libgcrypt/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGCRYPT,libgcrypt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-asm \
			--with-gpg-error-prefix="${STAGING_TARGET_DIR}/usr"

post-install:
	# provides own automake macros
	${INSTALL_DIR} ${STAGING_HOST_DIR}/usr/share/aclocal
	${CP} ${WRKINST}/usr/share/aclocal/libgcrypt.m4 \
		${STAGING_HOST_DIR}/usr/share/aclocal

libgcrypt-install:
	${INSTALL_DIR} ${IDIR_LIBGCRYPT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgcrypt.so* \
		${IDIR_LIBGCRYPT}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
