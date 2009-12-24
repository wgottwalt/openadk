# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		neon
PKG_VERSION=		0.28.4
PKG_RELEASE=		1
PKG_BUILDDEP+=		libpthread libxml2 openssl zlib
PKG_MD5SUM=		6c3b94362af743d046e198e9fcbe4a85
PKG_DESCR:=		HTTP and WebDAV library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpthread libxml2 libopenssl zlib
PKG_UTL:=		http://webdav.org/neon
PKG_SITES=		http://webdav.org/neon/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NEON,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-ssl=openssl \
			--without-gssapi \
			--with-libxml2
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_NEON}/usr/lib
	$(CP) ${WRKINST}/usr/lib/lib*.so.* ${IDIR_NEON}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
