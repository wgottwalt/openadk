# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gdb/Makefile.inc
include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GDB,gdb,${PKG_VERSION}-${PKG_RELEASE}))

TCPPFLAGS+=		-L${STAGING_DIR}/usr/lib -L${STAGING_DIR}/lib
TLDFLAGS+=		-L${STAGING_DIR}/usr/lib -L${STAGING_DIR}/lib
TCFLAGS+=		${TCPPFLAGS} -fPIC
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--without-uiout --enable-gdbmi \
			--disable-tui --disable-gdbtk --without-x \
			--without-included-gettext --disable-sim \
			--enable-threads --with-curses --disable-werror \
			--enable-static
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
XAKE_FLAGS+=		LDFLAGS='${TLDFLAGS}'

post-install:
	${INSTALL_DIR} ${IDIR_GDB}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gdb ${IDIR_GDB}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
