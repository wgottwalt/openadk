# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gdb/Makefile.inc

PKG_NAME:=		gdb
PKG_DESCR:=		programm debugger
PKG_SECTION:=		app/debug
PKG_DEPENDS:=		libthread-db libncurses libexpat zlib
PKG_BUILDDEP:=		ncurses readline expat zlib
PKG_NOPARALLEL:=	1

PKG_BUILDDEP_UCLIBC:=	libiconv-tiny

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GDB,gdb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		${TARGET_CPPFLAGS} -fPIC
CONFIGURE_ARGS+=	--without-uiout \
			--disable-tui \
			--disable-gdbtk \
			--without-x \
			--disable-sim \
			--disable-werror \
			--disable-gdbserver \
			--without-python \
			--without-included-gettext \
			--without-auto-load-safe-path \
			--disable-install-libiberty \
			--disable-install-libbfd \
			--with-curses \
			--enable-gdbmi

XAKE_FLAGS+=		LDFLAGS='${TARGET_LDFLAGS}'
# disable honour cflags stuff
XAKE_FLAGS+=		GCC_HONOUR_COPTS:=s

gdb-install:
	${INSTALL_DIR} ${IDIR_GDB}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gdb ${IDIR_GDB}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
