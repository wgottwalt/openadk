# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gdb/Makefile.inc

PKG_DESCR:=		GNU debugger (small server)
PKG_SECTION:=		debug
PKG_DEPENDS:=		libthread-db

PKG_TARGET_DEPENDS:=    !foxboard

include ${TOPDIR}/mk/package.mk

WRKSRC=                 ${WRKDIST}/gdb/gdbserver

$(eval $(call PKG_template,GDBSERVER,gdbserver,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_GDBSERVER}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gdbserver ${IDIR_GDBSERVER}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
