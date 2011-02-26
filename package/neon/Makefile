# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		neon
PKG_VERSION:=		0.29.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		ff369e69ef0f0143beb5626164e87ae2
PKG_DESCR:=		HTTP and WebDAV library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpthread libxml2 libopenssl zlib
PKG_BUILDDEP:=		libpthread libxml2 openssl zlib
PKG_URL:=		http://webdav.org/neon/
PKG_SITES:=		http://webdav.org/neon/

PKG_SUBPKGS:=		NEON NEON_DEV
PKGSC_NEON_DEV:=	devel
PKGSD_NEON_DEV:=	HTTP and WebDAV headers

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NEON,neon,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,NEON_DEV,neon-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_NEON_DEV},${PKGSC_NEON_DEV}))

CONFIGURE_ARGS+=	--with-ssl=openssl \
			--without-gssapi \
			--with-libxml2

neon-install:
	${INSTALL_DIR} ${IDIR_NEON}/usr/lib
	$(CP) ${WRKINST}/usr/lib/libneon.so* ${IDIR_NEON}/usr/lib

neon-dev-install:
	${INSTALL_DIR} ${IDIR_NEON_DEV}/usr/lib/pkgconfig
	${INSTALL_DIR} ${IDIR_NEON_DEV}/usr/include/neon
	${INSTALL_DATA} ${WRKINST}/usr/include/neon/*.h \
		${IDIR_NEON_DEV}/usr/include/neon
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/neon.pc \
		${IDIR_NEON_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
