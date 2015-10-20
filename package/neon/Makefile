# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		neon
PKG_VERSION:=		0.30.1
PKG_RELEASE:=		1
PKG_HASH:=		00c626c0dc18d094ab374dbd9a354915bfe4776433289386ed489c2ec0845cdd
PKG_DESCR:=		http and webdav library
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		libpthread libxml2 zlib
PKG_BUILDDEP:=		libpthread libxml2 zlib
PKG_URL:=		http://webdav.org/neon/
PKG_SITES:=		http://webdav.org/neon/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CHOICES_NEON:=	WITH_LIBRESSL WITH_OPENSSL
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl
PKGCD_WITH_OPENSSL:=	use openssl for crypto
PKGCB_WITH_OPENSSL:=	openssl
PKGCS_WITH_OPENSSL:=	libopenssl

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NEON,neon,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--with-ssl=openssl \
			--without-gssapi \
			--with-libxml2

neon-install:
	${INSTALL_DIR} ${IDIR_NEON}/usr/lib
	$(CP) ${WRKINST}/usr/lib/libneon.so* ${IDIR_NEON}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
