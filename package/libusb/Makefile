# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libusb
PKG_VERSION:=		1.0.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		37d34e6eaa69a4b645a19ff4ca63ceef
PKG_DESCR:=		a library for accessing Linux USB devices
PKG_SECTION:=		libs
PKG_URL:=		http://libusb.wiki.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libusb/}

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUSB,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBUSB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libusb*.so* ${IDIR_LIBUSB}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
