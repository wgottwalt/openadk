# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		gdb
PKG_VERSION:=		7.8.2
PKG_RELEASE:=		1
PKG_DESCR:=		programm debugger
PKG_SECTION:=		app/debug
PKG_HASH:=		605954d5747d5f08ea4b7f48e958d1ebbf39265e18f7f36738deeabb83744485
PKG_DEPENDS:=		libncurses zlib libexpat libthread-db
PKG_BUILDDEP:=		ncurses readline expat zlib
PKG_SITES:=		${MASTER_SITE_GNU:=gdb/}
PKG_NOPARALLEL:=	1

PKG_ARCH_DEPENDS:=	microblaze

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GDB,gdb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-static \
			--without-uiout \
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

gdb-install:
	${INSTALL_DIR} ${IDIR_GDB}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gdb \
		${IDIR_GDB}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
