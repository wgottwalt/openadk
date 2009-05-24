# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		quagga
PKG_VERSION:=		0.99.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		d2bb513f4ac113dbb300c15a0bd0a241
MASTER_SITES:=		http://www.quagga.net/download/ \
			http://www.de.quagga.net/download/ \
			http://www.uk.quagga.net/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,QUAGGA,quagga,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,QUAGGA_BGPD,quagga-bgpd,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,QUAGGA_OSPFD,quagga-ospfd,${PKG_VERSION}-${PKG_RELEASE}))
ifeq ($(ADK_IPV6),y)
$(eval $(call PKG_template,QUAGGA_OSPF6D,quagga-ospf6d,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,QUAGGA_RIPNGD,quagga-ripngd,${PKG_VERSION}-${PKG_RELEASE}))
endif
$(eval $(call PKG_template,QUAGGA_RIPD,quagga-ripd,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,QUAGGA_VTYSH,quagga-vtysh,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--localstatedir=/var/run/quagga \
			--sysconfdir=/etc/quagga \
			--enable-vtysh \
			--enable-user=quagga \
			--enable-group=quagga \
			--enable-multipath=8
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_QUAGGA}/usr/{lib,sbin}
	${INSTALL_DIR} ${IDIR_QUAGGA}/etc/init.d/
	${CP} ${WRKINST}/usr/lib/libzebra.so.* ${IDIR_QUAGGA}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/zebra \
		${WRKINST}/usr/sbin/watchquagga ${IDIR_QUAGGA}/usr/sbin/
	# avoid /etc being set to 0750
	${INSTALL_DIR} ${IDIR_QUAGGA}/etc/quagga/
	chmod 0750 ${IDIR_QUAGGA}/etc/quagga/
	${INSTALL_BIN} ./files/quagga.init \
		${IDIR_QUAGGA}/etc/init.d/quagga
	${INSTALL_DIR} ${IDIR_QUAGGA}/var/run/quagga
	${INSTALL_DIR} ${IDIR_QUAGGA_BGPD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/bgpd ${IDIR_QUAGGA_BGPD}/usr/sbin/
	${INSTALL_DIR} ${IDIR_QUAGGA_OSPFD}/usr/{lib,sbin}
	${CP} ${WRKINST}/usr/lib/libospf.so.* ${IDIR_QUAGGA_OSPFD}/usr/lib/
	${CP} ${WRKINST}/usr/sbin/ospfd ${IDIR_QUAGGA_OSPFD}/usr/sbin/
ifeq ($(ADK_IPV6),y)
	${INSTALL_DIR} ${IDIR_QUAGGA_OSPF6D}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ospf6d ${IDIR_QUAGGA_OSPF6D}/usr/sbin/
	${INSTALL_DIR} ${IDIR_QUAGGA_RIPNGD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ripngd ${IDIR_QUAGGA_RIPNGD}/usr/sbin/
endif
	${INSTALL_DIR} ${IDIR_QUAGGA_RIPD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ripd ${IDIR_QUAGGA_RIPD}/usr/sbin/
	${INSTALL_DIR} ${IDIR_QUAGGA_VTYSH}/usr/bin
	${CP} ${WRKINST}/usr/bin/vtysh ${IDIR_QUAGGA_VTYSH}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
