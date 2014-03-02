# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ether-wake
PKG_VERSION:=		1.09
PKG_RELEASE:=		1
PKG_DESCR:=		A Wake-On-LAN (WOL) client
PKG_SECTION:=		net

PKG_LIBC_DEPENDS:=	uclibc glibc

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ETHER_WAKE,ether-wake,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_CFLAGS+=		-Wall

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/ether-wake ${WRKBUILD}/ether-wake.c

do-install:
	${INSTALL_DIR} ${IDIR_ETHER_WAKE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/ether-wake ${IDIR_ETHER_WAKE}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
