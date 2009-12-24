# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		sqlite
PKG_VERSION:=		3.6.20
PKG_RELEASE:=		1
PKG_BUILDDEP+=		ncurses readline
PKG_MD5SUM:=		0faf8fc8ccff5297513c6532b2b4ce23
PKG_DESCR:=		Self-contained, embeddable, zero-configuration SQL database
PKG_SECTION:=		libs
PKG_URL:=		http://www.sqlite.org
PKG_SITES:=		http://www.sqlite.org/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSQLITE,libsqlite,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQLITE_CLI,sqlite-cli,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		config_BUILD_CC="${HOSTCC}" \
			config_BUILD_CFLAGS="${HOSTCFLAGS}" \
			config_TARGET_CC="${TARGET_CC}" \
			config_TARGET_CFLAGS="${TARGET_CFLAGS}" \
			config_TARGET_READLINE_INC="-I${STAGING_DIR}/usr/include" \
			config_TARGET_READLINE_LIBS="-L${STAGING_DIR}/usr/lib -lreadline -lncurses"
MAKE_FLAGS+=		LIBPTHREAD=-lm
CONFIGURE_ARGS+=	--disable-tcl \
			--without-tcl \
			--disable-amalgamation
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBSQLITE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libsqlite3.so* ${IDIR_LIBSQLITE}/usr/lib/
	${INSTALL_DIR} ${IDIR_SQLITE_CLI}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sqlite3 ${IDIR_SQLITE_CLI}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
