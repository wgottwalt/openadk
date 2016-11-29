# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXv
PKG_VERSION:=		1.0.11
PKG_RELEASE:=		1
PKG_HASH:=		c4112532889b210e21cf05f46f0f2f8354ff7e1b58061e12d7a76c95c0d47bb1
PKG_DESCR:=		xvideo extensions library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libX11 videoproto libXext
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxv
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXV,libxv,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxv-install:
	${INSTALL_DIR} ${IDIR_LIBXV}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXv.so* ${IDIR_LIBXV}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
