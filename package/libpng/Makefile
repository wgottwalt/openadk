# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libpng
PKG_VERSION:=		1.6.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		5f414b20f683b1d96b163c89e3eff768
PKG_DESCR:=		library for reading/writing png images
PKG_SECTION:=		libs/image
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.libpng.org/pub/png/libpng.html
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libpng/}
PKG_OPTS:=		dev

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBPNG,libpng,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBPNG,libpng,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

libpng-install:
	${INSTALL_DIR} ${IDIR_LIBPNG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpng*.so* ${IDIR_LIBPNG}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
