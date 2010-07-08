# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		lua
PKG_VERSION:=		5.1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		d0870f2de55d59c1c8419f36e8fac150
PKG_DESCR:=		LUA programming language
PKG_SECTION:=		lang
PKG_URL:=		http://www.lua.org
PKG_SITES:=		http://www.lua.org/ftp/ \
			http://ftp.gwdg.de/pub/languages/lua/ \
			http://mirrors.dotsrc.org/lua/ \
			http://www.tecgraf.puc-rio.br/lua/ftp/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBLUA,liblua,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LUA,lua,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LUAC,luac,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LUA_EXAMPLES,lua-examples,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${MAKE} -C ${WRKBUILD} \
		CC="${TARGET_CC}" \
		LD="${TARGET_CROSS}ld" \
		AR="${TARGET_CROSS}ar rcu" \
		RANLIB="${TARGET_CROSS}ranlib" \
		INSTALL_TOP=/usr \
		CFLAGS="${TCFLAGS} ${TCPPFLAGS} -DLUA_USE_LINUX -fPIC" \
		MYLDFLAGS="${TLDFLAGS}" \
		linux
	${MAKE} -C ${WRKBUILD} \
		INSTALL_TOP="${WRKINST}/usr" \
		install

do-install:
	${INSTALL_DIR} ${IDIR_LIBLUA}/usr/lib
	${CP} ${WRKINST}/usr/lib/liblua.a ${IDIR_LIBLUA}/usr/lib/
	${INSTALL_DIR} ${IDIR_LUA}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/lua ${IDIR_LUA}/usr/bin/
	${INSTALL_DIR} ${IDIR_LUAC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/luac ${IDIR_LUAC}/usr/bin/
	${INSTALL_DIR} ${IDIR_LUA_EXAMPLES}/usr/share/lua/examples
	${INSTALL_DATA} ${WRKBUILD}/test/*.lua \
		${IDIR_LUA_EXAMPLES}/usr/share/lua/examples/

include ${TOPDIR}/mk/pkg-bottom.mk
