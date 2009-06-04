# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libX11
PKG_VERSION:=		1.1.5
PKG_RELEASE:=		2
PKG_MD5SUM:=		2feb39a0de6f05b25c308268691d960c
PKG_DESCR:=		X11 client-side library
PKG_SECTION:=		x11
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBX11,libx11,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--enable-xlocale \
			--disable-xf86bigfont \
			--disable-malloc0returnsnull \
			--without-xcb
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBX11}/usr/lib ${IDIR_LIBX11}/usr/share/X11
	${CP} ${WRKINST}/usr/lib/libX11.so* ${IDIR_LIBX11}/usr/lib/
	${CP} ${WRKINST}/usr/share/X11/XKeysymDB ${IDIR_LIBX11}/usr/share/X11

include ${TOPDIR}/mk/pkg-bottom.mk
