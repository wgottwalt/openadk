# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		opencdk
PKG_VERSION:=		0.6.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		813d62d7afe7b2c2d8f3df0a6c9d9331
PKG_DESCR:=		Open Crypto Development Kit library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libgcrypt libgpg-error zlib
PKG_BUILDDEP:=		libgcrypt libgpg-error zlib
PKG_URL:=		http://www.gnu.org/software/gnutls/download.html
PKG_SITES:=		ftp://ftp.gnutls.org/pub/gnutls/opencdk/

PKG_SUBPKGS:=		LIBOPENCDK

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOPENCDK,libopencdk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-libgcrypt-prefix='${STAGING_DIR}/usr'

post-install:
	${INSTALL_DIR} ${IDIR_LIBOPENCDK}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopencdk.so* ${IDIR_LIBOPENCDK}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
