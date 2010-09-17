# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gdb/Makefile.inc

PKG_DESCR:=		GNU debugger
PKG_SECTION:=		debug
PKG_DEPENDS:=		libthread-db libncurses libiconv libexpat
PKG_BUILDDEP:=		ncurses readline libiconv expat
PKG_NOPARALLEL:=	1

PKG_TARGET_DEPENDS:=	!foxboard !ag241

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GDB,gdb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		${TCPPFLAGS} -fPIC
CONFIGURE_ARGS+=	--without-uiout --enable-gdbmi \
			--disable-tui --disable-gdbtk --without-x \
			--without-included-gettext --disable-sim \
			--enable-threads --with-curses --disable-werror \
			--enable-static --without-python
XAKE_FLAGS+=		LDFLAGS='${TLDFLAGS}'

post-install:
	${INSTALL_DIR} ${IDIR_GDB}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gdb ${IDIR_GDB}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
