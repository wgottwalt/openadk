# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libsigc++
PKG_VERSION:=		2.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		e27a20ac9bc9100f48effdfca8e8c595
PKG_DESCR:=		Callback framework for C++
PKG_SECTION:=		libs
PKG_DEPENDS:=		libstdc++
PKG_URL:=		http://libsigc.sourceforge.net
PKG_SITES:=		${MASTER_SITE_GNOME:=libsigc++/2.2/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSIGCXX,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBSIGCXX}/usr/lib
	${CP} ${WRKINST}/usr/lib/libsigc-2.0.so.* ${IDIR_LIBSIGCXX}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
