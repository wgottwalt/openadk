# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libusb-compat
PKG_VERSION:=		0.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		32c775b97da7a11c6be7c487a0c9fc00
PKG_DESCR:=		a Library for accessing Linux USB devices
PKG_SECTION:=		libs
PKG_URL:=		http://libusb.wiki.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libusb/}

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUSB_COMPAT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBUSB_COMPAT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libusb*.so* ${IDIR_LIBUSB_COMPAT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
