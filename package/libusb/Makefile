# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libusb
PKG_VERSION:=		1.0.19
PKG_RELEASE:=		1
PKG_HASH:=		6c502c816002f90d4f76050a6429c3a7e0d84204222cbff2dce95dd773ba6840
PKG_DESCR:=		library for accessing usb devices
PKG_SECTION:=		libs/misc
PKG_URL:=		http://libusb.wiki.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libusb/}
PKG_LIBNAME:=		libusb
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBUSB,libusb,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBUSB,libusb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CPPFLAGS=	-DTIMESPEC_TO_TIMEVAL=
HOST_CONFIGURE_ARGS+=	--disable-udev
CONFIGURE_ARGS+=	--disable-udev

libusb-install:
	${INSTALL_DIR} ${IDIR_LIBUSB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libusb*.so* ${IDIR_LIBUSB}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
