# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gdb/Makefile.inc

PKG_DESCR:=		GNU debugger
PKG_SECTION:=		debug
PKG_DEPENDS:=		libthread-db libncurses libiconv libexpat libgcc
PKG_BUILDDEP:=		ncurses readline libiconv expat
PKG_NOPARALLEL:=	1

PKG_ARCH_DEPENDS:=	!cris !avr32

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GDB,gdb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_STATIC),y)
TARGET_CFLAGS+=         -static
CONFIGURE_ARGS+=	--enable-static
endif

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
TARGET_CFLAGS+=		${TARGET_CPPFLAGS} -fPIC
CONFIGURE_ARGS+=	--without-uiout --enable-gdbmi \
			--disable-tui --disable-gdbtk --without-x \
			--without-included-gettext --disable-sim \
			--with-curses --disable-werror \
			--disable-gdbserver \
			--without-python
XAKE_FLAGS+=		LDFLAGS='${TARGET_LDFLAGS}'
# disable honour cflags stuff
XAKE_FLAGS+=		GCC_HONOUR_COPTS:=s

post-install:
	${INSTALL_DIR} ${IDIR_GDB}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gdb ${IDIR_GDB}/usr/bin/
	# shipped libbfd conflicts with system wide one
	rm -f ${WRKINST}/usr/lib/libbfd*

include ${TOPDIR}/mk/pkg-bottom.mk
