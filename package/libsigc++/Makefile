# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libsigc++
PKG_VERSION:=		2.2.10
PKG_RELEASE:=		2
PKG_HASH:=		d3d810c2ad469edfb2d4db29643bef189b7613019eadbd4a72823af3c73c959c
PKG_DESCR:=		callback framework for c++
PKG_SECTION:=		libs/misc
PKG_URL:=		http://libsigc.sourceforge.net
PKG_SITES:=		${MASTER_SITE_GNOME:=libsigc++/2.2/}
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSIGCXX,libsigc++,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libsigc++-install:
	${INSTALL_DIR} ${IDIR_LIBSIGCXX}/usr/lib
	${CP} ${WRKINST}/usr/lib/libsigc-2.0.so* ${IDIR_LIBSIGCXX}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
