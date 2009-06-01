# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libxkbfile
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		8be68d830d227cbd52cbafe24cb4fa78
PKG_DESCR:=		an interface to read and manipulate description files the X11 keyboard configuration extension
PKG_SECTION:=		x11
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXKBFILE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBXKBFILE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxkbfile.so* ${IDIR_LIBXKBFILE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
