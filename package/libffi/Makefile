# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libffi
PKG_VERSION:=		3.0.13
PKG_RELEASE:=		1
PKG_MD5SUM:=		45f3b6dbc9ee7c7dfbbbc5feba571529
PKG_DESCR:=		Foreign Function Interface library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		autotool libffi-host
HOST_BUILDDEP:=		autotool
PKG_URL:=		http://sourceware.org/libffi/
PKG_SITES:=		ftp://sourceware.org/pub/libffi/
PKG_OPTS:=		dev

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBFFI,libffi,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBFFI,libffi,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--disable-builddir --with-pic
CONFIGURE_ARGS+=	--disable-builddir --with-pic

libffi-install:
	${INSTALL_DIR} ${IDIR_LIBFFI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libffi.so* ${IDIR_LIBFFI}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
