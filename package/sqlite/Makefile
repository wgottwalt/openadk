# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		sqlite
PKG_VERSION:=		3.7.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		a9604a82613ade2e7f4c303f233e477f
PKG_DESCR:=		embeddable SQL database (cli)
PKG_SECTION:=		db
PKG_BUILDDEP:=		ncurses readline
PKG_URL:=		http://www.sqlite.org/
PKG_SITES:=		http://www.sqlite.org/

DISTFILES:=		sqlite-autoconf-3070500.tar.gz
WRKDIST=		${WRKDIR}/sqlite-autoconf-3070500

PKG_SUBPKGS:=		SQLITE_CLI LIBSQLITE
PKGSD_LIBSQLITE:=	sqlite library

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSQLITE,libsqlite,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBSQLITE},${PKG_SECTION}))
$(eval $(call PKG_template,SQLITE_CLI,sqlite-cli,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		config_BUILD_CC="${CC_FOR_BUILD}" \
			config_BUILD_CFLAGS="${CFLAGS_FOR_BUILD}" \
			config_TARGET_CC="${TARGET_CC}" \
			config_TARGET_CFLAGS="${TARGET_CFLAGS}" \
			config_TARGET_READLINE_INC="-I${STAGING_TARGET_DIR}/usr/include" \
			config_TARGET_READLINE_LIBS="-L${STAGING_TARGET_DIR}/usr/lib -lreadline -lncurses"

MAKE_FLAGS+=		LIBPTHREAD=-lm
TARGET_CPPFLAGS+=	-DSQLITE_SECURE_DELETE=1

libsqlite-install:
	${INSTALL_DIR} ${IDIR_LIBSQLITE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libsqlite3.so* ${IDIR_LIBSQLITE}/usr/lib

sqlite-cli-install:
	${INSTALL_DIR} ${IDIR_SQLITE_CLI}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sqlite3 ${IDIR_SQLITE_CLI}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
