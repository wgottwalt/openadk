# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		usbutils
PKG_VERSION:=		0.73
PKG_RELEASE:=		1
PKG_MD5SUM:=		88978b4ad891f610620b1b8e5e0f43eb

MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=linux-usb/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LSUSB,lsusb,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LSUSB}/usr/share
	${INSTALL_DATA} ${WRKINST}/usr/share/usb.ids.gz ${IDIR_LSUSB}/usr/share/
	${INSTALL_DIR} ${IDIR_LSUSB}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/lsusb ${IDIR_LSUSB}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
