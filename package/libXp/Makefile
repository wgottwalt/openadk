# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXp
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		1
PKG_HASH:=		f6b8cc4ef05d3eafc9ef5fc72819dd412024b4ed60197c0d5914758125817e9c
PKG_DESCR:=		x11 printing library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXext printproto
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxp
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXP,libxp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxp-install:
	${INSTALL_DIR} ${IDIR_LIBXP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXp.so* ${IDIR_LIBXP}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
