# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libffi
PKG_VERSION:=		3.1
PKG_RELEASE:=		2
PKG_HASH:=		97feeeadca5e21870fa4433bc953d1b3af3f698d5df8a428f68b73cd60aef6eb
PKG_DESCR:=		foreign function interface library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://sourceware.org/libffi/
PKG_SITES:=		ftp://sourceware.org/pub/libffi/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBFFI,libffi,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBFFI,libffi,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--disable-builddir --with-pic
CONFIGURE_ARGS+=	--disable-builddir --with-pic

libffi-install:
	${INSTALL_DIR} ${IDIR_LIBFFI}/usr/lib
	${CP} ${WRKINST}/usr/lib*/libffi.so* ${IDIR_LIBFFI}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
