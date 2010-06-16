# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXxf86vm
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		52b49483eccbdd1566b8c560fe7f76e8
PKG_DESCR:=		add short description
PKG_SECTION:=		libs
PKG_BUILDDEP+=		xf86vidmodeproto libXext
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/lib/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXXF86VM,libxxf86vm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

post-install:
	$(INSTALL_DIR) $(IDIR_LIBXXF86VM)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/lib/libXxf86vm*.so* \
		$(IDIR_LIBXXF86VM)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
