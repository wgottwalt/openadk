# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tntnet
PKG_VERSION:=		2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		8f7185eeed23e7ae6a9be314e2fc0d36
PKG_DESCR:=		small C++ application server
PKG_SECTION:=		www
PKG_DEPENDS:=		cxxtools zlib libiconv libpthread
PKG_BUILDDEP:=		cxxtools zlib libiconv
PKG_URL:=		http://www.tntnet.org/
PKG_SITES:=		http://www.tntnet.org/download/
PKG_NEED_CXX:=		1

PKG_ARCH_DEPENDS:=	!arm !avr32

PKG_CHOICES_TNTNET:=	WITHOUT_SSL WITH_OPENSSL WITH_GNUTLS
PKGCD_WITHOUT_SSL:=	use no SSL
PKGCD_WITH_OPENSSL:=	use OpenSSL for crypto
PKGCS_WITH_OPENSSL:=	libopenssl
PKGCB_WITH_OPENSSL:=	openssl
PKGCD_WITH_GNUTLS:=	use GnuTLS for crypto
PKGCS_WITH_GNUTLS:=	libgnutls
PKGCB_WITH_GNUTLS:=	gnutls

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TNTNET,tntnet,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_PACKAGE_TNTNET_WITHOUT_SSL},y)
CONFIGURE_ARGS+=	--with-ssl=no
endif
ifeq (${ADK_PACKAGE_TNTNET_WITH_OPENSSL},y)
CONFIGURE_ARGS+=	--with-ssl=openssl
endif
ifeq (${ADK_PACKAGE_TNTNET_WITH_GNUTLS},y)
CONFIGURE_ARGS+=	--with-ssl=gnutls
endif

CONFIGURE_ARGS+=	--without-epoll \
			--without-sdk \
			--without-cgi \
			--without-sendfile
CONFIGURE_ENV+= 	CXXFLAGS='${TARGET_CXXFLAGS}' \
			ac_cv_path_cxxtools_config=${STAGING_TARGET_DIR}/usr/bin
TARGET_LDFLAGS+=	-ldl

tntnet-install:
	${INSTALL_DIR} ${IDIR_TNTNET}/www
	${INSTALL_DIR} ${IDIR_TNTNET}/etc/tntnet
	${INSTALL_DIR} ${IDIR_TNTNET}/usr/bin
	${INSTALL_DIR} ${IDIR_TNTNET}/usr/lib/tntnet
	${INSTALL_DATA} ./files/tntnet.{conf,properties} \
		${IDIR_TNTNET}/etc/tntnet
	${INSTALL_DATA} ./files/mime.conf \
		${IDIR_TNTNET}/etc/tntnet
	${CP} ${WRKINST}/usr/bin/tntnet ${IDIR_TNTNET}/usr/bin
	${CP} ${WRKINST}/usr/lib/tntnet/tntnet.so* \
		${IDIR_TNTNET}/usr/lib/tntnet
	${CP} ${WRKINST}/usr/lib/libtntnet.so* \
		${IDIR_TNTNET}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
