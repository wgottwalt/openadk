# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXScrnSaver
PKG_VERSION:=		1.2.2
PKG_RELEASE:=		1
PKG_HASH:=		e12ba814d44f7b58534c0d8521e2d4574f7bf2787da405de4341c3b9f4cc8d96
PKG_DESCR:=		screensaver library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		scrnsaverproto libXext
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxscrnsaver
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXSCRNSAVER,libxscrnsaver,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-malloc0returnsnull

libxscrnsaver-install:
	$(INSTALL_DIR) $(IDIR_LIBXSCRNSAVER)/usr/lib
	${CP} $(WRKINST)/usr/lib/libXss.so* \
		$(IDIR_LIBXSCRNSAVER)/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
