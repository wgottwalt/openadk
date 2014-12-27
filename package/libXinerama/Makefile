# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXinerama
PKG_VERSION:=		1.1.2
PKG_RELEASE:=		2
PKG_HASH:=		5f21113464febeac0536e140ff36a8e0cd8ae919ce690c4768f479ea48473fed
PKG_DESCR:=		xinerama library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xineramaproto libXinerama-host
HOST_BUILDDEP:=		xineramaproto-host libXext-host
PKG_SITES:=		${MASTER_SITE_XORG}
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
