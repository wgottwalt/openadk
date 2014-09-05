# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk
include ${ADK_TOPDIR}/toolchain/gdb/Makefile.inc

PKG_NAME:=		gdbserver
PKG_DESCR:=		remote programm debugger utility
PKG_SECTION:=		app/debug
PKG_LIBC_DEPENDS:=	!musl

DISTFILES:=		gdb-${PKG_VERSION}.tar.xz
WRKDIST=		${WRKDIR}/gdb-${PKG_VERSION}
WRKSRC=                 ${WRKDIST}/gdb/gdbserver

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GDBSERVER,gdbserver,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

gdbserver-install:
	${INSTALL_DIR} ${IDIR_GDBSERVER}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gdbserver ${IDIR_GDBSERVER}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
