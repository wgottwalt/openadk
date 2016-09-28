# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		tntnet
PKG_VERSION:=		2.2.1
PKG_RELEASE:=		2
PKG_HASH:=		c83170d08ef04c5868051e1c28c74b9562fe71e9e8263828e755ad5bd3547521
PKG_DESCR:=		small c++ application server
PKG_SECTION:=		net/http
PKG_DEPENDS:=		cxxtools zlib
PKG_BUILDDEP:=		cxxtools zlib
PKG_NEEDS:=		threads c++
PKG_URL:=		http://www.tntnet.org/
PKG_SITES:=		http://www.tntnet.org/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CHOICES_TNTNET:=	WITH_LIBRESSL WITH_GNUTLS WITHOUT_SSL
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCS_WITH_LIBRESSL:=	libressl
PKGCB_WITH_LIBRESSL:=	libressl
PKGCD_WITH_GNUTLS:=	use gnutls for crypto
PKGCS_WITH_GNUTLS:=	libgnutls
PKGCB_WITH_GNUTLS:=	gnutls
PKGCD_WITHOUT_SSL:=	use no ssl

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TNTNET,tntnet,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_PACKAGE_TNTNET_WITHOUT_SSL},y)
CONFIGURE_ARGS+=	--with-ssl=no
endif
ifeq (${ADK_PACKAGE_TNTNET_WITH_LIBRESSL},y)
CONFIGURE_ARGS+=	--with-ssl=openssl
endif
ifeq (${ADK_PACKAGE_TNTNET_WITH_GNUTLS},y)
CONFIGURE_ARGS+=	--with-ssl=gnutls
endif

CONFIGURE_ARGS+=	--without-epoll \
			--without-sdk \
			--without-cgi \
			--disable-unittest \
			--disable-locale \
			--without-sendfile
CONFIGURE_ENV+= 	CXXFLAGS='${TARGET_CXXFLAGS}' \
			ac_cv_path_cxxtools_config=${STAGING_TARGET_DIR}/usr/bin


tntnet-install:
	${INSTALL_DIR} ${IDIR_TNTNET}/www
	${INSTALL_DIR} ${IDIR_TNTNET}/etc/tntnet
	${INSTALL_DIR} ${IDIR_TNTNET}/usr/bin
	${INSTALL_DIR} ${IDIR_TNTNET}/usr/lib/tntnet
	${INSTALL_DATA} ./files/tntnet.{xml,properties} \
		${IDIR_TNTNET}/etc/tntnet
	${INSTALL_DATA} ./files/mime.conf \
		${IDIR_TNTNET}/etc/tntnet
	${CP} ${WRKINST}/usr/bin/tntnet ${IDIR_TNTNET}/usr/bin
	${CP} ${WRKINST}/usr/lib/tntnet/tntnet.so* \
		${IDIR_TNTNET}/usr/lib/tntnet
	${CP} ${WRKINST}/usr/lib/libtntnet.so* \
		${IDIR_TNTNET}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
