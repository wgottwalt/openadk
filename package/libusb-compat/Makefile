# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libusb-compat
PKG_VERSION:=		0.1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		570ac2ea085b80d1f74ddc7c6a93c0eb
PKG_DESCR:=		a library for accessing Linux USB devices
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libusb
PKG_URL:=		http://libusb.wiki.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libusb/}

PKG_SUBPKGS:=		LIBUSB_COMPAT LIBUSB_COMPAT_DEV
PKGSD_LIBUSB_COMPAT_DEV:=	header files for libusb library
PKGSC_LIBUSB_COMPAT_DEV:=	devel

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUSB_COMPAT,libusb-compat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBUSB_COMPAT_DEV,libusb-compat-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBUSB_COMPAT_DEV},${PKGSC_LIBUSB_COMPAT_DEV},${PKG_OPTS}))

libusb-compat-install:
	${INSTALL_DIR} ${IDIR_LIBUSB_COMPAT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libusb*.so* ${IDIR_LIBUSB_COMPAT}/usr/lib

libusb-compat-dev-install:
	${INSTALL_DIR} ${IDIR_LIBUSB_COMPAT_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBUSB_COMPAT_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
