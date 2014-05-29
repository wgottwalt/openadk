# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		serdisplib
PKG_VERSION:=		1.97.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		2aa91c43d01d2dfc9fbc1116e3063ae1
PKG_DESCR:=		display drivers (serial, parallel, usb)
PKG_SECTION:=		sys/serial
PKG_DEPENDS:=		libusb-compat
PKG_BUILDDEP:=		libgd libusb-compat
PKG_URL:=		http://serdisplib.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=serdisplib/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SERDISPLIB,serdisplib,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual

CONFIGURE_ENV+=		PACKAGE_VERSION_MAJOR=1 PACKAGE_VERSION_MINOR=97
CONFIGURE_ARGS+=	--enable-libusb
TARGET_CFLAGS+=		${TARGET_CPPFLAGS}

do-install:
	${INSTALL_DIR} ${IDIR_SERDISPLIB}/usr/lib
	${CP} ${WRKBUILD}/lib/libserdisp.so* ${IDIR_SERDISPLIB}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
