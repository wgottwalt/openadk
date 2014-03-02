# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		digitemp
PKG_VERSION:=		3.6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		9be2e48db37920f21925ae6e88f83b84
PKG_DESCR:=		program for reading values from 1-wire devices
PKG_SECTION:=		misc
PKG_DEPENDS:=		libusb
PKG_BUILDDEP:=		libusb libusb-compat
PKG_URL:=		http://www.digitemp.com/software/linux/
PKG_SITES:=		http://www.digitemp.com/software/linux/

PKG_LIBC_DEPENDS:=	uclibc glibc

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DIGITEMP,digitemp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_CPPFLAGS+=	-I./src -I./userial
ALL_TARGET=		ds2490

do-install:
	${INSTALL_DIR} ${IDIR_DIGITEMP}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/digitemp_DS2490 \
		${IDIR_DIGITEMP}/usr/sbin/digitemp_DS2490

include ${TOPDIR}/mk/pkg-bottom.mk
