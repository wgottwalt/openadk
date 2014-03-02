# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		heyu
PKG_VERSION:=		2.6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		9c7624b61ea39bbfa70336dc703cd5f1
PKG_DESCR:=		X10 home automation control using the CM11A
PKG_SECTION:=		serial
PKG_DEPENDS:=		setserial
PKG_URL:=		http://heyu.tanj.com/
PKG_SITES:=		http://heyu.tanj.com/download/

PKG_LIBC_DEPENDS:=	uclibc glibc

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${TOPDIR}/mk/package.mk

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

include ${TOPDIR}/mk/pkg-bottom.mk
