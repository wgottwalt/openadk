# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		freetype
PKG_VERSION:=		2.7
PKG_RELEASE:=		1
PKG_HASH:=		7b657d5f872b0ab56461f3bd310bd1c5ec64619bd15f0d8e08282d494d9cfea4
PKG_DESCR:=		free, high-quality and portable font engine
PKG_SECTION:=		libs/fonts
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.freetype.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=freetype/}
PKG_LIBNAME:=		libfreetype
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBFREETYPE,libfreetype,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBFREETYPE,libfreetype,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--with-zlib \
			--without-png \
			--without-bzip2
CONFIGURE_ARGS+=	--with-zlib \
			--without-png \
			--with-harfbuzz=no \
			--without-bzip2

libfreetype-install:
	${INSTALL_DIR} ${IDIR_LIBFREETYPE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfreetype.so* ${IDIR_LIBFREETYPE}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
