# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libusb
PKG_VERSION:=		1.0.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		f9e2bb5879968467e5ca756cb4e1fa7e
PKG_DESCR:=		library for accessing usb devices
PKG_SECTION:=		libs/misc
PKG_URL:=		http://libusb.wiki.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libusb/}
PKG_LIBNAME:=		libusb
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUSB,libusb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CPPFLAGS=	-DTIMESPEC_TO_TIMEVAL=
CONFIGURE_ARGS+=	--disable-udev

libusb-install:
	${INSTALL_DIR} ${IDIR_LIBUSB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libusb*.so* ${IDIR_LIBUSB}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
