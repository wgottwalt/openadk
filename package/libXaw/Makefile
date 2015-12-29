# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXaw
PKG_VERSION:=		1.0.13
PKG_RELEASE:=		1
PKG_HASH:=		7e74ac3e5f67def549722ff0333d6e6276b8becd9d89615cda011e71238ab694
PKG_DESCR:=		athena widget library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXext libXmu libXpm
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxaw
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXAW,libxaw,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxaw-install:
	${INSTALL_DIR} ${IDIR_LIBXAW}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXaw*.so* ${IDIR_LIBXAW}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
