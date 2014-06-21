# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		sqlite
PKG_VERSION:=		3.8.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		0544ef6d7afd8ca797935ccc2685a9ed
PKG_DESCR:=		embeddable sql database cli
PKG_SECTION:=		sys/misc
PKG_BUILDDEP:=		ncurses readline
PKG_DEPENDS:=		libsqlite
PKG_URL:=		http://www.sqlite.org/
PKG_SITES:=		http://www.sqlite.org/2014/
PKG_LIBNAME:=		libsqlite
PKG_OPTS:=		dev

DISTFILES:=		sqlite-autoconf-3080500.tar.gz
WRKDIST=		${WRKDIR}/sqlite-autoconf-3080500

PKG_SUBPKGS:=		SQLITE_CLI LIBSQLITE
PKGSD_LIBSQLITE:=	emeddable sql library
PKGSC_LIBSQLITE:=	libs/db

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSQLITE,libsqlite,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBSQLITE},${PKGSD_LIBSQLITE},${PKGSC_LIBSQLITE},${PKG_OPTS}))
$(eval $(call PKG_template,SQLITE_CLI,sqlite-cli,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		config_BUILD_CC="${CC_FOR_BUILD}" \
			config_BUILD_CFLAGS="${CFLAGS_FOR_BUILD}" \
			config_TARGET_CC="${TARGET_CC}" \
			config_TARGET_CFLAGS="${TARGET_CFLAGS}" \
			config_TARGET_READLINE_INC="-I${STAGING_TARGET_DIR}/usr/include" \
			config_TARGET_READLINE_LIBS="-L${STAGING_TARGET_DIR}/usr/lib -lreadline -lncurses"

MAKE_FLAGS+=		LIBPTHREAD=-lm
TARGET_CPPFLAGS+=	-DSQLITE_SECURE_DELETE=1 -DSQLITE_THREADSAFE=1 -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_UNLOCK_NOTIFY=1

libsqlite-install:
	${INSTALL_DIR} ${IDIR_LIBSQLITE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libsqlite3.so* ${IDIR_LIBSQLITE}/usr/lib

sqlite-cli-install:
	${INSTALL_DIR} ${IDIR_SQLITE_CLI}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sqlite3 ${IDIR_SQLITE_CLI}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
