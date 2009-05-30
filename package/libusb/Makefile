# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libusb
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		8fb0e066678a0d294894b5b2969cb4b3
PKG_DESCR:=		a Library for accessing Linux USB devices
PKG_SECTION:=		libs
PKG_URL:=		http://libusb.wiki.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libusb/}

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUSB,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBUSB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libusb*.so* ${IDIR_LIBUSB}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
