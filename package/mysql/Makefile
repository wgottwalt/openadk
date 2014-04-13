# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mysql
PKG_VERSION:=		5.6.17
PKG_RELEASE:=		1
PKG_MD5SUM:=		82114fa7c13fa3ca897b34666577d9f4
PKG_DESCR:=		MySQL client library
PKG_SECTION:=		db
PKG_DEPENDS:=		libncurses zlib
PKG_BUILDDEP:=		cmake-host mysql-host ncurses zlib readline
HOST_BUILDDEP:=		cmake-host
PKG_URL:=		http://www.mysql.com/
PKG_SITES=		${MASTER_SITE_MYSQL:=Downloads/MySQL-5.6/}
PKG_LIBNAME:=		libmysqlclient
PKG_OPTS:=		dev

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,MYSQL,mysql,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBMYSQLCLIENT,libmysqlclient,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		manual
CONFIG_STYLE:=		manual

host-configure:
	cd ${WRKBUILD} && PATH='${HOST_PATH}' \
		cmake .

host-build:
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET} $(MAKE_TRACE)

mysql-hostinstall:
	$(INSTALL_BIN) ${WRKBUILD}/extra/comp_err \
		$(STAGING_HOST_DIR)/usr/bin
	$(INSTALL_BIN) ${WRKBUILD}/scripts/comp_sql \
		$(STAGING_HOST_DIR)/usr/bin
	$(INSTALL_BIN) ${WRKBUILD}/sql/gen_lex_hash \
		$(STAGING_HOST_DIR)/usr/bin
	$(INSTALL_BIN) ${WRKBUILD}/storage/perfschema/gen_pfs_lex_token \
		$(STAGING_HOST_DIR)/usr/bin

do-configure:
	sed -e "s#@@TARGET_CC@@#$(TARGET_CC)#" \
	 	-e "s#@@TARGET_CXX@@#$(TARGET_CXX)#" \
		-e "s#@@TARGET_CFLAGS@@#$(TARGET_CFLAGS)#" \
		-e "s#@@TARGET_CXXFLAGS@@#$(TARGET_CXXFLAGS)#" \
		-e "s#@@STAGING_TARGET_DIR@@#$(STAGING_TARGET_DIR)#" \
		-e "s#@@STAGING_HOST_DIR@@#$(STAGING_HOST_DIR)#" \
		$(SCRIPT_DIR)/toolchain.cmake.in > $(SCRIPT_DIR)/toolchain.cmake
	(cd ${WRKBUILD} && PATH='${HOST_PATH}' \
		cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
			-DCMAKE_TOOLCHAIN_FILE="$(SCRIPT_DIR)/toolchain.cmake" \
			-DWITH_EDITLINE=bundled \
			-DCURSES_LIBRARY="$(STAGING_TARGET_DIR)/usr/lib" \
			-DCURSES_INCLUDE_PATH="$(STAGING_TARGET_DIR)/usr/lib" \
			-DSTACK_DIRECTION=1 \
			.)
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

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
