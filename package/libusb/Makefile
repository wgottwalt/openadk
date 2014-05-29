# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libusbx
PKG_VERSION:=		1.0.16
PKG_RELEASE:=		3
PKG_MD5SUM:=		7f5715d624cd6c26b30a317eb6c2fe5e
PKG_DESCR:=		library for accessing usb devices
PKG_SECTION:=		libs/misc
PKG_URL:=		http://libusb.wiki.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libusbx/}
PKG_LIBNAME:=		libusb
PKG_OPTS:=		dev

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUSB,libusb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CPPFLAGS=	-DTIMESPEC_TO_TIMEVAL=
CONFIGURE_ARGS+=	--disable-udev

libusb-install:
	${INSTALL_DIR} ${IDIR_LIBUSB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libusb*.so* ${IDIR_LIBUSB}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
