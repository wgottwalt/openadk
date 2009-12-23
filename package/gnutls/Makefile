# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gnutls
PKG_VERSION:=		2.8.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		e3b2788b79bfc82acbe717e3c54d4e92
PKG_DESCR:=		GNU TLS library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libgcrypt libtasn1 zlib
PKG_BUILDDEP+=		libgcrypt liblzo libtasn1 opencdk zlib ncurses
PKG_URL:=		http://www.gnu.org/software/gnutls
PKG_SITES:=		${MASTER_SITE_GNU:=gnutls/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGNUTLS,libgnutls,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GNUTLS_UTILS,gnutls-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBGNUTLS_EXTRA,libgnutls-extra,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBGNUTLS_OPENSSL,libgnutls-openssl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-libopencdk-prefix \
			--disable-camellia \
			--with-libgcrypt-prefix=${STAGING_DIR}/usr \
			--without-libz-prefix
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBGNUTLS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgnutls.so.* ${IDIR_LIBGNUTLS}/usr/lib
	${INSTALL_DIR} ${IDIR_LIBGNUTLS_EXTRA}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgnutls-extra.so.* ${IDIR_LIBGNUTLS_EXTRA}/usr/lib
	${INSTALL_DIR} ${IDIR_LIBGNUTLS_OPENSSL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgnutls-openssl.so.* ${IDIR_LIBGNUTLS_OPENSSL}/usr/lib
	${INSTALL_DIR} ${IDIR_GNUTLS_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/{{cert,srp,psk}tool,gnutls-{cli,serv}} \
	    ${IDIR_GNUTLS_UTILS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
