# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libSM
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		39ee8e9dfbb2c1788629066ce796df22
PKG_DESCR:=		X11 Session Management library
PKG_SECTION:=		x11
PKG_DEPENDS:=		libuuid
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSM,libsm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBSM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libSM.so* ${IDIR_LIBSM}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
