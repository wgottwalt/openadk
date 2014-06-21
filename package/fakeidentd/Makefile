# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		fakeidentd
PKG_VERSION:=		2.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		ebf398bd1843a1fd8c71f5fcf4a6e4f7
PKG_DESCR:=		secure ident daemon
PKG_SECTION:=		net/misc
PKG_SITES:=		http://distfiles.gentoo.org/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
WRKDIST=		${WRKDIR}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FAKEIDENTD,fakeidentd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/fakeidentd ${WRKBUILD}/identd.c

do-install:
	${INSTALL_DIR} ${IDIR_FAKEIDENTD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/fakeidentd ${IDIR_FAKEIDENTD}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
