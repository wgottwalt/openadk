# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk
include ${ADK_TOPDIR}/toolchain/gdb/Makefile.inc

PKG_NAME:=		gdb
PKG_DESCR:=		programm debugger
PKG_SECTION:=		app/debug
PKG_DEPENDS:=		libncurses zlib
PKG_BUILDDEP:=		ncurses readline expat zlib
PKG_NOPARALLEL:=	1

PKG_ARCH_DEPENDS:=	!m68k !avr32

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GDB,gdb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		${TARGET_CPPFLAGS} -fPIC
CONFIGURE_ARGS+=	--without-uiout \
			--disable-tui \
			--disable-gdbtk \
			--disable-gdbserver \
			--without-x \
			--disable-sim \
			--disable-werror \
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
	# shipped libbfd conflicts with system wide one
	rm -f ${WRKINST}/usr/lib/libbfd*

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
