# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dnsmasq
PKG_VERSION:=		2.49
PKG_RELEASE:=		1
PKG_MD5SUM:=		7ccc861d8a733474f9c0a0a127006ee9
PKG_DESCR:=		A lightweight DNS and DHCP server
PKG_SECTION:=		net
PKG_URL:=		http://thekelleys.org.uk/dnsmasq
PKG_SITES:=		http://thekelleys.org.uk/dnsmasq/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DNSMASQ,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
INSTALL_STYLE=		manual
MAKE_FLAGS+=		BINDIR=/usr/sbin MANDIR=/usr/man COPTS="${TCFLAGS}"
ifneq ($(ADK_IPV6),y)
MAKE_FLAGS+=		COPTS="${TCFLAGS} -DNO_IPV6"
endif

do-install:
	${INSTALL_DIR} ${IDIR_DNSMASQ}/usr/sbin ${IDIR_DNSMASQ}/etc
	${INSTALL_BIN} ${WRKBUILD}/src/dnsmasq ${IDIR_DNSMASQ}/usr/sbin/
	${INSTALL_DATA} files/dnsmasq.conf ${IDIR_DNSMASQ}/etc/dnsmasq.conf

include ${TOPDIR}/mk/pkg-bottom.mk
