# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		strace
PKG_VERSION:=		4.8
PKG_RELEASE:=		2
PKG_MD5SUM:=		c575ef43829586801f514fd91bfe7575
PKG_DESCR:=		System call trace program
PKG_SECTION:=		debug
PKG_DEPENDS:=		libgcc
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=strace/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,STRACE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_STATIC),y)
TARGET_CFLAGS+=		-static
endif
ifeq ($(ADK_TARGET_LIB_MUSL),y)
TARGET_CPPFLAGS+=	-DMSG_EXCEPT=020000 -D_LARGEFILE64_SOURCE=1
endif

INSTALL_STYLE:=		manual

do-install:
	${INSTALL_DIR} ${IDIR_STRACE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/strace ${IDIR_STRACE}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
