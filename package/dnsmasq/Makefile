# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dnsmasq
PKG_VERSION:=		2.47
PKG_RELEASE:=		1
PKG_MD5SUM:=		4524081e56d0b935717d493e8e8d3e11
MASTER_SITES:=		http://thekelleys.org.uk/dnsmasq/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DNSMASQ,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE:=		auto
INSTALL_STYLE=		manual
MAKE_FLAGS+=		BINDIR=/usr/sbin MANDIR=/usr/man COPTS="${TCFLAGS}"
ifneq ($(ADK_IPV6),y)
MAKE_FLAGS+=		COPTS="${TCFLAGS} -DNO_IPV6"
endif

do-install:
	${INSTALL_DIR} ${IDIR_DNSMASQ}/{etc/init.d,usr/sbin}
	${INSTALL_BIN} ${WRKBUILD}/src/dnsmasq ${IDIR_DNSMASQ}/usr/sbin/
	${INSTALL_DATA} files/dnsmasq.conf ${IDIR_DNSMASQ}/etc/dnsmasq.conf
	${INSTALL_BIN} files/dnsmasq.init ${IDIR_DNSMASQ}/etc/init.d/dnsmasq

include ${TOPDIR}/mk/pkg-bottom.mk
