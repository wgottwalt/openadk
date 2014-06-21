# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXaw
PKG_VERSION:=		1.0.11
PKG_RELEASE:=		2
PKG_MD5SUM:=		c487a810a8a9b0eb5091f382790b4e75
PKG_DESCR:=		athena widget library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXext libXmu libXpm
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxaw
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXAW,libxaw,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxaw-install:
	${INSTALL_DIR} ${IDIR_LIBXAW}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXaw*.so* ${IDIR_LIBXAW}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
