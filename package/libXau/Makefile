# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXau
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		1a421d9376f43596fe068ce209a70b84
PKG_DESCR:=		X11 authorisation library
PKG_SECTION:=		x11
PKG_SITES:=		${MASTER_SITE_XORG}

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXAU,libxau,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBXAU}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXau.so* ${IDIR_LIBXAU}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
