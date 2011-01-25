# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXxf86vm
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		822a847fc4ea1b38f6c4d6f86d1e4fd9
PKG_DESCR:=		an interface to the XFree86-VidModeExtension extension
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xf86vidmodeproto libXext
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXXF86VM,libxxf86vm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

post-install:
	$(INSTALL_DIR) $(IDIR_LIBXXF86VM)/usr/lib
	${CP} $(WRKINST)/usr/lib/libXxf86vm*.so* \
		$(IDIR_LIBXXF86VM)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
