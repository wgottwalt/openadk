# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXScrnSaver
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		8e459e544298caa27fc7c7e5a56e2a6d
PKG_DESCR:=		screensaver library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		scrnsaverproto libXext
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxscrnsaver
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXSCRNSAVER,libxscrnsaver,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-malloc0returnsnull

libxscrnsaver-install:
	$(INSTALL_DIR) $(IDIR_LIBXSCRNSAVER)/usr/lib
	${CP} $(WRKINST)/usr/lib/libXss.so* \
		$(IDIR_LIBXSCRNSAVER)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
