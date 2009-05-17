# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		procps
PKG_VERSION:=		3.2.7
PKG_RELEASE:=		4
PKG_MD5SUM:=		f490bca772b16472962c7b9f23b1e97d
MASTER_SITES:=		http://procps.sourceforge.net/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PROCPS,procps,${PKG_VERSION}-${PKG_RELEASE},${ARCH},libncurses))

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
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
	${INSTALL_BIN} killall ${IDIR_PROCPS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
