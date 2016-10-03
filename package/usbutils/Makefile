# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		usbutils
PKG_VERSION:=		008
PKG_RELEASE:=		2
PKG_HASH:=		44741af0bae9d402a0ef160a29b2fa700bb656ab5e0a4b3343d51249c2a44c8c
PKG_DESCR:=		program to list usb devices
PKG_SECTION:=		sys/hw
PKG_DEPENDS:=		libusb libusb-compat libudev
PKG_BUILDDEP:=		libusb libusb-compat eudev
PKG_NEEDS:=		threads
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/usb/usbutils/
PKG_BB:=		1

PKG_SUBPKGS:=		LSUSB

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LSUSB,lsusb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lsusb-install:
	${INSTALL_DIR} ${IDIR_LSUSB}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/lsusb ${IDIR_LSUSB}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
