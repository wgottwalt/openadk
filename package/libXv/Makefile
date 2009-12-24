# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXv
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libX11 videoproto
PKG_MD5SUM:=		6ee98790de6b3cd470074e60057d5c5c
PKG_DESCR:=		X11 Xvideo extensions
PKG_SECTION:=		x11
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXV,libxv,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-malloc0returnsnull
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBXV}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXv.so* ${IDIR_LIBXV}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
