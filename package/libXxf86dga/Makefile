# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXxf86dga
PKG_VERSION:=		1.1.4
PKG_RELEASE:=		1
PKG_HASH:=		e6361620a15ceba666901ca8423e8be0c6ed0271a7088742009160349173766b
PKG_DESCR:=		client library for the xfree86-dga extension
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xf86dgaproto libXext libXaw
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxxf86dga
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXXF86DGA,libxxf86dga,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+= 	--disable-malloc0returnsnull

libxxf86dga-install:
	${INSTALL_DIR} ${IDIR_LIBXXF86DGA}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXxf86dga.so* ${IDIR_LIBXXF86DGA}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
