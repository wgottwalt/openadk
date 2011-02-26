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

PKG_SUBPKGS:=		LIBXXF86VM LIBXXF86VM_DEV
PKGSC_LIBXXF86VM_DEV:=	devel
PKSSD_LIBXXF86VM_DEV:=	XFree86-VidModeExtension headers

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXXF86VM,libxxf86vm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXXF86VM_DEV,libxxf86vm-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKSSD_LIBXXF86VM_DEV},${PKGSC_LIBXXF86VM_DEV}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxxf86vm-install:
	$(INSTALL_DIR) $(IDIR_LIBXXF86VM)/usr/lib
	${CP} $(WRKINST)/usr/lib/libXxf86vm*.so* \
		$(IDIR_LIBXXF86VM)/usr/lib

libxxf86vm-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBXXF86VM_DEV)/usr/include
	${CP} $(WRKINST)/usr/include/* \
		$(IDIR_LIBXXF86VM_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_LIBXXF86VM_DEV)/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		$(IDIR_LIBXXF86VM_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
