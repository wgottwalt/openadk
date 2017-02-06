# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		procps
PKG_VERSION:=		3.2.8
PKG_RELEASE:=		2
PKG_HASH:=		11ed68d8a4433b91cd833deb714a3aa849c02aea738c42e6b4557982419c1535
PKG_DESCR:=		/proc file system utilities
PKG_SECTION:=		base/tools
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://procps.sourceforge.net/
PKG_SITES:=		http://procps.sourceforge.net/
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PROCPS,procps,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual

procps-install:
	${INSTALL_DIR} ${IDIR_PROCPS}/{bin,sbin,usr/bin}
	${INSTALL_BIN} ${WRKINST}/usr/bin/uptime ${IDIR_PROCPS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/tload ${IDIR_PROCPS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/free ${IDIR_PROCPS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/w ${IDIR_PROCPS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/top ${IDIR_PROCPS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/vmstat ${IDIR_PROCPS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/watch ${IDIR_PROCPS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/pmap ${IDIR_PROCPS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/pgrep ${IDIR_PROCPS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/slabtop ${IDIR_PROCPS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/pwdx ${IDIR_PROCPS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/bin/kill ${IDIR_PROCPS}/bin
	${INSTALL_BIN} ${WRKINST}/bin/ps ${IDIR_PROCPS}/bin
	${INSTALL_BIN} ${WRKINST}/sbin/sysctl ${IDIR_PROCPS}/sbin
	cd ${IDIR_PROCPS}/usr/bin; \
	    ln -sf ../../bin/kill skill; \
	    ln -sf ../../bin/kill snice; \
	    ln -sf pgrep pkill

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
