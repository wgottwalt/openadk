# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		quagga
PKG_VERSION:=		0.99.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		350fb150be526cdfc4d2b093cb4d69a7
PKG_DESCR:=		A routing software package
PKG_SECTION:=		route
PKG_BUILDDEP+=		readline ncurses
PKG_MULTI:=		1
PKG_URL:=		http://www.quagga.net/
PKG_SITES:=		http://www.quagga.net/download/

PKG_DESCR_1:=		BGP daemon
PKG_DESCR_2:=		OSPF daemon
PKG_DESCR_3:=		OSPF IPv6 daemon
PKG_DESCR_4:=		RIPng daemon
PKG_DESCR_5:=		RIP daemon
PKG_DESCR_6:=		vtysh utility


include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,QUAGGA,quagga,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_BGPD,quagga-bgpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_1},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_OSPFD,quagga-ospfd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_2},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_OSPF6D,quagga-ospf6d,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_3},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_RIPNGD,quagga-ripngd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_4},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_RIPD,quagga-ripd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_5},${PKG_SECTION}))
$(eval $(call PKG_template,QUAGGA_VTYSH,quagga-vtysh,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_6},${PKG_SECTION}))

CONFIGURE_ENV+=		quagga_cv_ipforward_method="proc"
CONFIGURE_ARGS+=	--localstatedir=/var/run/quagga \
			--sysconfdir=/etc/quagga \
			--enable-vtysh \
			--enable-user=quagga \
			--enable-group=quagga \
			--disable-pie \
			--enable-multipath=8

post-install:
	${INSTALL_DIR} ${IDIR_QUAGGA}/usr/{lib,sbin}
	${CP} ${WRKINST}/usr/lib/libzebra.so.* ${IDIR_QUAGGA}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/zebra \
		${WRKINST}/usr/sbin/watchquagga ${IDIR_QUAGGA}/usr/sbin/
	# avoid /etc being set to 0750
	${INSTALL_DIR} ${IDIR_QUAGGA}/etc/quagga/
	chmod 0750 ${IDIR_QUAGGA}/etc/quagga/
	${INSTALL_DIR} ${IDIR_QUAGGA_BGPD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/bgpd ${IDIR_QUAGGA_BGPD}/usr/sbin/
	${INSTALL_DIR} ${IDIR_QUAGGA_OSPFD}/usr/{lib,sbin}
	${CP} ${WRKINST}/usr/lib/libospf.so.* ${IDIR_QUAGGA_OSPFD}/usr/lib/
	${CP} ${WRKINST}/usr/sbin/ospfd ${IDIR_QUAGGA_OSPFD}/usr/sbin/
	${INSTALL_DIR} ${IDIR_QUAGGA_OSPF6D}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ospf6d ${IDIR_QUAGGA_OSPF6D}/usr/sbin/
	${INSTALL_DIR} ${IDIR_QUAGGA_RIPNGD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ripngd ${IDIR_QUAGGA_RIPNGD}/usr/sbin/
	${INSTALL_DIR} ${IDIR_QUAGGA_RIPD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ripd ${IDIR_QUAGGA_RIPD}/usr/sbin/
	${INSTALL_DIR} ${IDIR_QUAGGA_VTYSH}/usr/bin
	${CP} ${WRKINST}/usr/bin/vtysh ${IDIR_QUAGGA_VTYSH}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
