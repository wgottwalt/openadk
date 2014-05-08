# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		lua
PKG_VERSION:=		5.1.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		d0870f2de55d59c1c8419f36e8fac150
PKG_DESCR:=		LUA programming language interpreter
PKG_SECTION:=		lang
PKG_DEPENDS:=		libreadline
PKG_BUILDDEP:=		readline
PKG_URL:=		http://www.lua.org/
PKG_SITES:=		http://www.lua.org/ftp/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		LUA LUAC LUA_EXAMPLES
PKGSD_LUAC:=		LUA bytecode compiler
PKGSN_LUAC:=		lua
PKGSD_LUAEXAMPLES:=	LUA script examples
PKGSN_LUAEXAMPLES:=	lua

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LUA,lua,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LUAC,luac,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LUAC},${PKG_SECTION}))
$(eval $(call PKG_template,LUA_EXAMPLES,lua-examples,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LUAEXAMPLES},${PKG_SECTION}))

CONFIG_STYLE:=		manual
MAKE_FLAGS+=		CFLAGS="${TARGET_CFLAGS} ${TARGET_CPPFLAGS} -DLUA_USE_LINUX -fPIC" \
			MYLDFLAGS="${TARGET_LDFLAGS}" \
			CC="${TARGET_CC}" LD="${TARGET_CROSS}ld" \
			AR="${TARGET_CROSS}ar rcu" \
			RANLIB="${TARGET_CROSS}ranlib"
XAKE_FLAGS+=		INSTALL_TOP="${WRKINST}/usr"
ALL_TARGET:=		linux

lua-install:
	${INSTALL_DIR} ${IDIR_LUA}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/lua ${IDIR_LUA}/usr/bin/

luac-install:
	${INSTALL_DIR} ${IDIR_LUAC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/luac ${IDIR_LUAC}/usr/bin/

lua-examples-install:
	${INSTALL_DIR} ${IDIR_LUA_EXAMPLES}/usr/share/lua/examples
	${INSTALL_DATA} ${WRKBUILD}/test/*.lua \
		${IDIR_LUA_EXAMPLES}/usr/share/lua/examples/

include ${TOPDIR}/mk/pkg-bottom.mk
