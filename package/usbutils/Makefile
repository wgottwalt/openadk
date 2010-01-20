# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		usbutils
PKG_VERSION:=		0.73
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libusb libusb-compat
PKG_MD5SUM:=		88978b4ad891f610620b1b8e5e0f43eb
PKG_DESCR:=		A program to list USB devices
PKG_SECTION:=		misc
PKG_DEPENDS:=		libusb libusb-compat libpthread
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=linux-usb/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LSUSB,lsusb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LSUSB}/usr/share
	${INSTALL_DATA} ${WRKINST}/usr/share/usb.ids.gz ${IDIR_LSUSB}/usr/share/
	${INSTALL_DIR} ${IDIR_LSUSB}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/lsusb ${IDIR_LSUSB}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
