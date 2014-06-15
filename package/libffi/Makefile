# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libffi
PKG_VERSION:=		3.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		f5898b29bbfd70502831a212d9249d10
PKG_DESCR:=		foreign function interface library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		autotool
HOST_BUILDDEP:=		autotool
PKG_URL:=		http://sourceware.org/libffi/
PKG_SITES:=		ftp://sourceware.org/pub/libffi/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

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
