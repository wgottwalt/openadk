# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXext
PKG_VERSION:=		1.3.3
PKG_RELEASE:=		1
PKG_HASH:=		eb0b88050491fef4716da4b06a4d92b4fc9e76f880d6310b2157df604342cfe5
PKG_DESCR:=		client interface to extensions of the x protocol
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libX11 xextproto libXext-host
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxext
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXEXT,libxext,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXEXT,libxext,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxext-install:
	${INSTALL_DIR} ${IDIR_LIBXEXT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXext.so* ${IDIR_LIBXEXT}/usr/lib/

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
