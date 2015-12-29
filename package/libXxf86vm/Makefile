# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXxf86vm
PKG_VERSION:=		1.1.4
PKG_RELEASE:=		1
PKG_HASH:=		5108553c378a25688dcb57dca383664c36e293d60b1505815f67980ba9318a99
PKG_DESCR:=		interface to the xfree86-vidmode extension
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xf86vidmodeproto libXext
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxxf86vm
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXXF86VM,libxxf86vm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxxf86vm-install:
	$(INSTALL_DIR) $(IDIR_LIBXXF86VM)/usr/lib
	${CP} $(WRKINST)/usr/lib/libXxf86vm*.so* \
		$(IDIR_LIBXXF86VM)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
