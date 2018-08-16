# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		gdb
PKG_VERSION:=		8.1
PKG_RELEASE:=		1
PKG_HASH:=		af61a0263858e69c5dce51eab26662ff3d2ad9aa68da9583e8143b5426be4b34
PKG_DESCR:=		programm debugger
PKG_SECTION:=		app/debug
PKG_SITES:=		${MASTER_SITE_GNU:=gdb/}
PKG_DEPENDS:=		libncurses zlib libexpat libthread-db
PKG_BUILDDEP:=		ncurses readline expat zlib
PKG_NEEDS:=		c++

PKG_ARCH_DEPENDS:=	!arc !cris !avr32 !nios2 !microblaze !or1k !riscv32 !riscv64

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GDB,gdb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		MAKEINFO=true

# --enable-static is required to build libbfd.a
CONFIGURE_ARGS+=	--enable-static \
			--without-uiout \
			--disable-tui \
			--disable-gdbtk \
			--disable-gdbserver \
			--without-x \
			--with-expat \
			--disable-sim \
			--disable-plugins \
			--disable-werror \
			--without-python \
			--without-included-gettext \
			--without-auto-load-safe-path \
			--disable-install-libiberty \
			--disable-install-libbfd \
			--with-system-zlib \
			--with-curses \
			--enable-gdbmi

gdb-install:
	${INSTALL_DIR} ${IDIR_GDB}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gdb \
		${IDIR_GDB}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
