# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		quagga
PKG_VERSION:=		0.99.22.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		03ef24a448be47beba80efa2152f8a28
PKG_DESCR:=		routing software package
PKG_SECTION:=		net/route
PKG_BUILDDEP:=		readline ncurses
PKG_URL:=		http://www.quagga.net/
PKG_SITES:=		http://download.savannah.gnu.org/releases/quagga/

PKG_SUBPKGS:=		QUAGGA QUAGGA_BGPD QUAGGA_OSPFD QUAGGA_OSPF6D
PKG_SUBPKGS+=		QUAGGA_RIPNGD QUAGGA_RIPD QUAGGA_VTYSH
PKGSD_QUAGGA_BGPD:=	BGP daemon
PKGSN_QUAGGA_BGPD:=	quagga
PKGSD_QUAGGA_OSPFD:=	OSPF daemon
PKGSN_QUAGGA_OSPFD:=	quagga
PKGSD_QUAGGA_OSPF6D:=	OSPF IPv6 daemon
PKGSN_QUAGGA_OSPF6D:=	quagga
PKGSD_QUAGGA_RIPNGD:=	RIPng daemon
PKGSN_QUAGGA_RIPNGD:=	quagga
PKGSD_QUAGGA_RIPD:=	RIP daemon
PKGSN_QUAGGA_RIPD:=	quagga
PKGSD_QUAGGA_VTYSH:=	vtysh utility
PKGSN_QUAGGA_VTYSH:=	quagga

PKG_FLAVOURS_QUAGGA:=	WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,QUAGGA,quagga,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_BGPD,quagga-bgpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_QUAGGA_BGPD},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_OSPFD,quagga-ospfd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_QUAGGA_OSPFD},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_OSPF6D,quagga-ospf6d,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_QUAGGA_OSPF6D},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_RIPNGD,quagga-ripngd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_QUAGGA_RIPNGD},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_RIPD,quagga-ripd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_QUAGGA_RIPD},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_VTYSH,quagga-vtysh,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_QUAGGA_VTYSH},${PKG_SECTION}))

CONFIGURE_ENV+=		quagga_cv_ipforward_method="proc"
CONFIGURE_ARGS+=	--localstatedir=/var/run/quagga \
			--sysconfdir=/etc/quagga \
			--enable-vtysh \
			--enable-user=quagga \
			--enable-group=quagga \
			--disable-pie \
			--disable-babeld \
			--disable-doc \
			--disable-tests \
			--enable-multipath=8

ifneq (${ADK_PACKAGE_QUAGGA_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

quagga-install:
	${INSTALL_DIR} ${IDIR_QUAGGA}/usr/{lib,sbin}
	${CP} ${WRKINST}/usr/lib/libzebra.so.* ${IDIR_QUAGGA}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/zebra \
		${WRKINST}/usr/sbin/watchquagga ${IDIR_QUAGGA}/usr/sbin/
	# avoid /etc being set to 0750
	${INSTALL_DIR} ${IDIR_QUAGGA}/etc/quagga/
	chmod 0750 ${IDIR_QUAGGA}/etc/quagga/

quagga-bgpd-install:
	${INSTALL_DIR} ${IDIR_QUAGGA_BGPD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/bgpd ${IDIR_QUAGGA_BGPD}/usr/sbin/

quagga-ospfd-install:
	${INSTALL_DIR} ${IDIR_QUAGGA_OSPFD}/usr/{lib,sbin}
	${CP} ${WRKINST}/usr/lib/libospf.so.* ${IDIR_QUAGGA_OSPFD}/usr/lib/
	${CP} ${WRKINST}/usr/sbin/ospfd ${IDIR_QUAGGA_OSPFD}/usr/sbin/

quagga-ospf6d-install:
ifneq (${ADK_PACKAGE_QUAGGA_WITH_IPV6},)
	${INSTALL_DIR} ${IDIR_QUAGGA_OSPF6D}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ospf6d ${IDIR_QUAGGA_OSPF6D}/usr/sbin/
endif

quagga-ripngd-install:
	${INSTALL_DIR} ${IDIR_QUAGGA_RIPNGD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ripngd ${IDIR_QUAGGA_RIPNGD}/usr/sbin/

quagga-ripd-install:
	${INSTALL_DIR} ${IDIR_QUAGGA_RIPD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ripd ${IDIR_QUAGGA_RIPD}/usr/sbin/

quagga-vtysh-install:
	${INSTALL_DIR} ${IDIR_QUAGGA_VTYSH}/usr/bin
	${CP} ${WRKINST}/usr/bin/vtysh ${IDIR_QUAGGA_VTYSH}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
