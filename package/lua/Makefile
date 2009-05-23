# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		lua
PKG_VERSION:=		5.0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		dea74646b7e5c621fef7174df83c34b1
MASTER_SITES:=		http://www.lua.org/ftp/ \
			http://ftp.gwdg.de/pub/languages/lua/ \
			http://mirrors.dotsrc.org/lua/ \
			http://www.tecgraf.puc-rio.br/lua/ftp/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBLUA,liblua,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LUA,lua,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LUAC,luac,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LUA_EXAMPLES,lua-examples,${PKG_VERSION}-${PKG_RELEASE}))

do-build:
	${MAKE} -C ${WRKBUILD} \
		CC="${TARGET_CC}" \
		LD="${TARGET_CROSS}ld" \
		AR="${TARGET_CROSS}ar rcu" \
		RANLIB="${TARGET_CROSS}ranlib" \
		INSTALL_ROOT=/usr \
		MYCFLAGS="${TCFLAGS} ${TCPPFLAGS}" \
		MYLDFLAGS="${TLDFLAGS}" \
		all so
	# remove statically linked binaries, so that they will get linked against shlib this time
	rm -f ${WRKBUILD}/bin/lua{,c}
	${MAKE} -C ${WRKBUILD} \
		CC="${TARGET_CC}" \
		LD="${TARGET_CROSS}ld" \
		AR="${TARGET_CROSS}ar rcu" \
		RANLIB="${TARGET_CROSS}ranlib" \
		INSTALL_ROOT=/usr \
		MYCFLAGS="${TCFLAGS} ${TCPPFLAGS}" \
		MYLDFLAGS="${TLDFLAGS}" \
		all
	rm -rf ${WRKINST}
	mkdir -p ${WRKINST}
	${MAKE} -C ${WRKBUILD} \
		INSTALL_ROOT="${WRKINST}/usr" \
		install soinstall

do-install:
	${INSTALL_DIR} ${IDIR_LIBLUA}/usr/lib
	${CP} ${WRKINST}/usr/lib/liblua{,lib}.so.* ${IDIR_LIBLUA}/usr/lib/
	${INSTALL_DIR} ${IDIR_LUA}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/lua ${IDIR_LUA}/usr/bin/
	${INSTALL_DIR} ${IDIR_LUAC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/luac ${IDIR_LUAC}/usr/bin/
	${INSTALL_DIR} ${IDIR_LUA_EXAMPLES}/usr/share/lua/examples
	${INSTALL_DATA} ${WRKBUILD}/test/*.lua \
		${IDIR_LUA_EXAMPLES}/usr/share/lua/examples/

include ${TOPDIR}/mk/pkg-bottom.mk
