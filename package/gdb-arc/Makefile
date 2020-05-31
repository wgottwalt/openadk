# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		gdb
PKG_VERSION:=		arc-2018.03-release-gdb
PKG_GIT:=		tag
PKG_RELEASE:=		1
PKG_DESCR:=		program debugger
PKG_SECTION:=		app/debug
PKG_DEPENDS:=		libncurses zlib libexpat libthread-db
PKG_BUILDDEP:=		ncurses readline expat zlib
PKG_SITES:=		https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb.git

PKG_ARCH_DEPENDS:=	arc

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
