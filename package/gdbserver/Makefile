# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gdb/Makefile.inc
include ${TOPDIR}/mk/package.mk

WRKSRC=                 ${WRKDIST}/gdb/gdbserver

$(eval $(call PKG_template,GDBSERVER,gdbserver,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_GDBSERVER}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gdbserver ${IDIR_GDBSERVER}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
