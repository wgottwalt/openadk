# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mysql
PKG_VERSION:=		5.6.19
PKG_RELEASE:=		2
PKG_HASH:=		80ef3aae048866539380e7e330d9f1034f0ee50ddfb9c662570132492678b09f
PKG_DESCR:=		mysql client library
PKG_SECTION:=		libs/db
PKG_DEPENDS:=		libncurses zlib libevent
PKG_BUILDDEP:=		cmake-host mysql-host ncurses zlib readline libevent
HOST_BUILDDEP:=		cmake-host
PKG_URL:=		http://www.mysql.com/
PKG_SITES=		${MASTER_SITE_MYSQL:=Downloads/MySQL-5.6/}
PKG_LIBNAME:=		libmysqlclient
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,MYSQL,mysql,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBMYSQLCLIENT,libmysqlclient,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		manual
CONFIG_STYLE:=		cmake
CMAKE_FLAGS+=		-DSTACK_DIRECTION=1 \
			-DHAVE_LLVM_LIBCPP=0 \
			-DWITH_EDITLINE=bundled \
			-DCURSES_LIBRARY="$(STAGING_TARGET_DIR)/usr/lib" \
			-DCURSES_INCLUDE_PATH="$(STAGING_TARGET_DIR)/usr/include"

host-configure:
	cd ${WRKBUILD} && PATH='${HOST_PATH}' \
		cmake .

host-build:
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET} $(MAKE_TRACE)

pre-configure:
	$(SED) "s#@@STAGING_DIR@@#${STAGING_TARGET_DIR}#" ${WRKBUILD}/scripts/mysql_config.sh

mysql-hostinstall:
	$(INSTALL_BIN) ${WRKBUILD}/extra/comp_err \
		$(STAGING_HOST_DIR)/usr/bin
	$(INSTALL_BIN) ${WRKBUILD}/scripts/comp_sql \
		$(STAGING_HOST_DIR)/usr/bin
	$(INSTALL_BIN) ${WRKBUILD}/sql/gen_lex_hash \
		$(STAGING_HOST_DIR)/usr/bin
	$(INSTALL_BIN) ${WRKBUILD}/storage/perfschema/gen_pfs_lex_token \
		$(STAGING_HOST_DIR)/usr/bin

post-configure:
	$(CP) $(STAGING_HOST_DIR)/usr/bin/comp_err \
		${WRKBUILD}/extra/
	$(CP) $(STAGING_HOST_DIR)/usr/bin/comp_sql \
		${WRKBUILD}/scripts/
	$(CP) $(STAGING_HOST_DIR)/usr/bin/gen_lex_hash \
		${WRKBUILD}/sql/
	$(CP) $(STAGING_HOST_DIR)/usr/bin/gen_pfs_lex_token \
		${WRKBUILD}/storage/perfschema/

libmysqlclient-install:
	${INSTALL_DIR} ${IDIR_LIBMYSQLCLIENT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmysqlclient.so* \
	    ${IDIR_LIBMYSQLCLIENT}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
