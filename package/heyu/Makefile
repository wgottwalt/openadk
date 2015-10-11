# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		heyu
PKG_VERSION:=		2.6.0
PKG_RELEASE:=		1
PKG_HASH:=		1284e793520d2e152d9d7032f6727e72fbaaf7c4f4eaf9abea2b85eed090b0d2
PKG_DESCR:=		x10 home automation control utility
PKG_SECTION:=		sys/serial
PKG_DEPENDS:=		setserial
PKG_URL:=		http://heyu.tanj.com/
PKG_SITES:=		http://heyu.tanj.com/download/

PKG_LIBC_DEPENDS:=	uclibc-ng glibc

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HEYU,heyu,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-configure:
	(cd ${WRKBUILD} && ${BASH} ./Configure linux);

do-build:
	${MAKE} -C ${WRKBUILD} \
		CC="${TARGET_CC}" LD=${TARGET_CROSS}ld \
		CFLAGS="${TARGET_CFLAGS} -I${WRKBUILD} -DSYSV -DPOSIX -DHAS_ITIMER -DLINUX -DHASSELECT -DHASTZ"

do-install:
	${INSTALL_DIR} ${IDIR_HEYU}/etc/${PKG_NAME}
	${INSTALL_DATA} ./files/x10.conf ${IDIR_HEYU}/etc/${PKG_NAME}/x10.conf
	${INSTALL_DIR} ${IDIR_HEYU}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/heyu ${IDIR_HEYU}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
