# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libusb-compat
PKG_VERSION:=		0.1.5
PKG_RELEASE:=		1
PKG_HASH:=		404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a
PKG_DESCR:=		library for accessing usb devices
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		libusb
PKG_URL:=		http://www.libusb.org/wiki/libusb-compat-0.1
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libusb/}
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUSB_COMPAT,libusb-compat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libusb-compat-install:
	${INSTALL_DIR} ${IDIR_LIBUSB_COMPAT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libusb*.so* ${IDIR_LIBUSB_COMPAT}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
