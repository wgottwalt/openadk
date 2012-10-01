# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		sqlite
PKG_VERSION:=		3.7.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		6464d429b1396a8db35864e791673b65
PKG_DESCR:=		embeddable SQL database (cli)
PKG_SECTION:=		db
PKG_BUILDDEP:=		ncurses readline
PKG_URL:=		http://www.sqlite.org/
PKG_SITES:=		http://www.sqlite.org/

DISTFILES:=		sqlite-autoconf-3071400.tar.gz
WRKDIST=		${WRKDIR}/sqlite-autoconf-3071400

PKG_SUBPKGS:=		SQLITE_CLI LIBSQLITE LIBSQLITE_DEV
PKGSD_LIBSQLITE:=	sqlite library

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSQLITE,libsqlite,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBSQLITE},${PKG_SECTION}))
$(eval $(call PKG_template,LIBSQLITE_DEV,libsqlite-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBSQLITE},${PKG_SECTION}))
$(eval $(call PKG_template,SQLITE_CLI,sqlite-cli,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
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

libsqlite-dev-install:
	${INSTALL_DIR} ${IDIR_LIBSQLITE_DEV}/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBSQLITE_DEV}/usr/lib/pkgconfig
	${INSTALL_DIR} ${IDIR_LIBSQLITE_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* \
		${IDIR_LIBSQLITE_DEV}/usr/include
	

include ${TOPDIR}/mk/pkg-bottom.mk
