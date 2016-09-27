# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mariadb
PKG_VERSION:=		10.1.17
PKG_RELEASE:=		1
PKG_HASH:=		4ca45ac5e34418761868115ebc8c068d511fed08e283b2cac52559d63ba4aab5
PKG_DESCR:=		mariadb client library
PKG_SECTION:=		libs/db
PKG_DEPENDS:=		libncurses zlib libevent libpcre
PKG_BUILDDEP:=		cmake-host mariadb-host ncurses zlib readline libevent pcre
HOST_BUILDDEP:=		cmake-host
PKG_URL:=		http://www.mariadb.org/
PKG_SITES=		https://downloads.mariadb.org/interstitial/mariadb-$(PKG_VERSION)/source/
PKG_LIBNAME:=		libmariadbclient
PKG_OPTS:=		dev

# atomic ops not implemented
PKG_ARCH_DEPENDS:=	!mips

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,MARIADB,mariadb,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBMARIADBCLIENT,libmariadbclient,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		manual
HOST_ALL_TARGET:=	import_executables

CONFIG_STYLE:=		cmake
CMAKE_FLAGS+=		-DCMAKE_CROSSCOMPILING=1 \
			-DIMPORT_EXECUTABLES=${BASE_DIR}/host_build_${GNU_HOST_NAME}/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)-host/$(PKG_NAME)-$(PKG_VERSION)/import_executables.cmake \
			-DWITHOUT_SERVER=ON \
			-DSECURITY_HARDENED=OFF \
			-DWITHOUT_MROONGA=ON \
			-DWITHOUT_TOKUDB=ON \
			-DSTACK_DIRECTION=-1 \
			-DWITH_JEMALLOC=no \
			-DWITH_SYSTEMD=no \
			-DWITH_UNIT_TESTS=OFF

host-configure:
	cd ${WRKBUILD} && PATH='${HOST_PATH}' cmake .

host-build:
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET} $(MAKE_TRACE)

mariadb-hostinstall:
	@echo

libmariadbclient-install:
	${INSTALL_DIR} ${IDIR_LIBMARIADBCLIENT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmysqlclient.so* \
	    ${IDIR_LIBMARIADBCLIENT}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
