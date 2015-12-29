# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXft
PKG_VERSION:=		2.3.2
PKG_RELEASE:=		1
PKG_HASH:=		26cdddcc70b187833cbe9dc54df1864ba4c03a7175b2ca9276de9f05dce74507
PKG_DESCR:=		freetype library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXrender fontconfig
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxft
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFT,libxft,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxft-install:
	${INSTALL_DIR} ${IDIR_LIBXFT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXft.so* ${IDIR_LIBXFT}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
