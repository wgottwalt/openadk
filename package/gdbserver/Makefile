# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk
include ${ADK_TOPDIR}/toolchain/gdb/Makefile.inc

PKG_NAME:=		gdb
PKG_DESCR:=		remote programm debugger utility
PKG_SECTION:=		app/debug
PKG_DEPENDS:=		libthread-db

PKG_LIBC_DEPENDS:=	!musl
PKG_SUBPKGS:=		GDBSERVER

WRKSRC=                 ${WRKDIST}/gdb/gdbserver

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GDBSERVER,gdbserver,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

gdbserver-install:
	${INSTALL_DIR} ${IDIR_GDBSERVER}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gdbserver ${IDIR_GDBSERVER}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
