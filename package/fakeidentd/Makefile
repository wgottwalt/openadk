# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		fakeidentd
PKG_VERSION:=		2.6
PKG_RELEASE:=		1
PKG_HASH:=		696a57b58ede48c65b9c3743d3d96be70abf5406f0173964e4cd05dd6c8f0b90
PKG_DESCR:=		secure ident daemon
PKG_SECTION:=		net/misc

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FAKEIDENTD,fakeidentd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/fakeidentd ${WRKBUILD}/fakeidentd-2.6.c

do-install:
	${INSTALL_DIR} ${IDIR_FAKEIDENTD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/fakeidentd ${IDIR_FAKEIDENTD}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
