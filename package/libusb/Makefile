# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libusb
PKG_VERSION:=		0.1.10a
PKG_RELEASE:=		1
PKG_MD5SUM:=		c6062b29acd2cef414bcc34e0decbdd1
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=libusb/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUSB,libusb,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_c_bigendian=no
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBUSB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libusb*.so* ${IDIR_LIBUSB}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
