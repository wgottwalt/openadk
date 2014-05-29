# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libusb-compat
PKG_VERSION:=		0.1.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		2780b6a758a1e2c2943bdbf7faf740e4
PKG_DESCR:=		library for accessing usb devices
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		libusb
PKG_URL:=		http://www.libusb.org/wiki/libusb-compat-0.1
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libusb/}
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUSB_COMPAT,libusb-compat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libusb-compat-install:
	${INSTALL_DIR} ${IDIR_LIBUSB_COMPAT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libusb*.so* ${IDIR_LIBUSB_COMPAT}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
