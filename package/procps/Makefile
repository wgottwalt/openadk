# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		procps
PKG_VERSION:=		3.2.8
PKG_RELEASE:=		2
PKG_MD5SUM:=		9532714b6846013ca9898984ba4cd7e0
PKG_DESCR:=		/proc file system utilities
PKG_SECTION:=		base/apps
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://procps.sourceforge.net/
PKG_SITES:=		http://procps.sourceforge.net/
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PROCPS,procps,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
TARGET_LDFLAGS+=	-ltinfo

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

include ${TOPDIR}/mk/pkg-bottom.mk
