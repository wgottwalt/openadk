# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		usbutils
PKG_VERSION:=		006
PKG_RELEASE:=		1
PKG_MD5SUM:=		c9aa14ee3d6c991fda183f42cf72a8a8
PKG_DESCR:=		program to list USB devices
PKG_SECTION:=		utils
PKG_DEPENDS:=		libusb libusb-compat libpthread zlib librt libgcc
PKG_BUILDDEP:=		libusb libusb-compat zlib
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/usb/usbutils/

PKG_SUBPKGS:=		LSUSB

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LSUSB,lsusb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lsusb-install:
	${INSTALL_DIR} ${IDIR_LSUSB}/usr/share
	${INSTALL_DATA} ${WRKINST}/usr/share/usb.ids.gz \
		${IDIR_LSUSB}/usr/share/
	${INSTALL_DIR} ${IDIR_LSUSB}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/lsusb ${IDIR_LSUSB}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
