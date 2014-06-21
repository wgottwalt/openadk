# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		ether-wake
PKG_VERSION:=		1.09
PKG_RELEASE:=		1
PKG_DESCR:=		wake-on-lan client
PKG_SECTION:=		net/misc
PKG_BB:=		1

PKG_LIBC_DEPENDS:=	uclibc glibc
NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ETHER_WAKE,ether-wake,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/ether-wake ${WRKBUILD}/ether-wake.c

do-install:
	${INSTALL_DIR} ${IDIR_ETHER_WAKE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/ether-wake ${IDIR_ETHER_WAKE}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
