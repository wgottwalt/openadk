# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXinerama
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		1
PKG_HASH:=		0ba243222ae5aba4c6a3d7a394c32c8b69220a6872dbb00b7abae8753aca9a44
PKG_DESCR:=		xinerama library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xextproto libXext xineramaproto libXinerama-host
HOST_BUILDDEP:=		xineramaproto-host libXext-host
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxinerama
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXINERAMA,libxinerama,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXINERAMA,libxinerama,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
CONFIGURE_ARGS+= 	--disable-malloc0returnsnull

libxinerama-install:
	${INSTALL_DIR} ${IDIR_LIBXINERAMA}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXinerama.so* ${IDIR_LIBXINERAMA}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
