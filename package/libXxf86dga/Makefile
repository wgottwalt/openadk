# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXxf86dga
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		ecb81708157e1a1eeaba0e124f0ade08
PKG_DESCR:=		client library for the XFree86-DGA extension
PKG_SECTION:=		x11
PKG_BUILDDEP+=		xf86dgaproto libXext libXaw
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXXF86DGA,libxxf86dga,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+= 	--disable-malloc0returnsnull

post-install:
	${INSTALL_DIR} ${IDIR_LIBXXF86DGA}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXxf86dga.so* ${IDIR_LIBXXF86DGA}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
