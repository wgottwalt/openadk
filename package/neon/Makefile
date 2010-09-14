# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		neon
PKG_VERSION:=		0.29.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		ba1015b59c112d44d7797b62fe7bee51
PKG_DESCR:=		HTTP and WebDAV library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpthread libxml2 libopenssl zlib
PKG_BUILDDEP:=		libpthread libxml2 openssl zlib
PKG_URL:=		http://webdav.org/neon/
PKG_SITES:=		http://webdav.org/neon/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NEON,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-ssl=openssl \
			--without-gssapi \
			--with-libxml2

post-install:
	${INSTALL_DIR} ${IDIR_NEON}/usr/lib
	$(CP) ${WRKINST}/usr/lib/lib*.so* ${IDIR_NEON}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
