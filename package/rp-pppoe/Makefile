# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rp-pppoe
PKG_VERSION:=		3.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		d58a13cc4185bca6121a606ff456dec0
PKG_DESCR:=		ppp over ethernet tools
PKG_SECTION:=		net/ppp
PKG_DEPENDS:=		ppp
PKG_URL:=		http://www.roaringpenguin.com/
PKG_SITES:=		http://www.roaringpenguin.com/files/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc glibc
PKG_SUBPKGS:=		RP_PPPOE RP_PPPOE_CLIENT RP_PPPOE_RELAY RP_PPPOE_SERVER RP_PPPOE_SNIFF
PKGSD_RP_PPPOE_CLIENT:=	PPPoE client
PKGSN_RP_PPPOE_CLIENT:=	rp-pppoe
PKGSD_RP_PPPOE_RELAY:=	PPPoE relay service
PKGSN_RP_PPPOE_RELAY:=	rp-pppoe
PKGSD_RP_PPPOE_SERVER:=	PPPoE server
PKGSN_RP_PPPOE_SERVER:=	rp-pppoe
PKGSD_RP_PPPOE_SNIFF:=	PPPoE sniffer
PKGSN_RP_PPPOE_SNIFF:=	rp-pppoe

WRKSRC=			${WRKDIST}/src

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RP_PPPOE_CLIENT,rp-pppoe-client,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_RP_PPPOE_CLIENT},${PKG_SECTION}))
$(eval $(call PKG_template,RP_PPPOE_RELAY,rp-pppoe-relay,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_RP_PPPOE_RELAY},${PKG_SECTION}))
$(eval $(call PKG_template,RP_PPPOE_SERVER,rp-pppoe-server,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_RP_PPPOE_SERVER},${PKG_SECTION}))
$(eval $(call PKG_template,RP_PPPOE_SNIFF,rp-pppoe-sniff,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_RP_PPPOE_SNIFF},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_func_setvbuf_reversed=no \
			ac_cv_sizeof_unsigned_short=2 \
			ac_cv_sizeof_unsigned_int=4 \
			ac_cv_sizeof_unsigned_long=4 \
			ac_cv_linux_kernel_pppoe=yes \
			ac_cv_pack_bitfields_reversed=yes

rp-pppoe-client-install:
	${INSTALL_DIR} ${IDIR_RP_PPPOE_CLIENT}/etc/ppp \
		${IDIR_RP_PPPOE_CLIENT}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/etc/ppp/pppoe.conf \
		${IDIR_RP_PPPOE_CLIENT}/etc/ppp
	${CP} ${WRKINST}/usr/sbin/pppoe ${IDIR_RP_PPPOE_CLIENT}/usr/sbin/
	${CP} ${WRKINST}/usr/sbin/pppoe-connect ${IDIR_RP_PPPOE_CLIENT}/usr/sbin/
	${CP} ${WRKINST}/usr/sbin/pppoe-start ${IDIR_RP_PPPOE_CLIENT}/usr/sbin/
	${CP} ${WRKINST}/usr/sbin/pppoe-stop ${IDIR_RP_PPPOE_CLIENT}/usr/sbin/
	${CP} ${WRKINST}/usr/sbin/pppoe-status ${IDIR_RP_PPPOE_CLIENT}/usr/sbin/
	${CP} ${WRKINST}/usr/sbin/pppoe-setup ${IDIR_RP_PPPOE_CLIENT}/usr/sbin/

rp-pppoe-relay-install:
	${INSTALL_DIR} ${IDIR_RP_PPPOE_RELAY}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pppoe-relay \
		${IDIR_RP_PPPOE_RELAY}/usr/sbin/

rp-pppoe-server-install:
	${INSTALL_DIR} ${IDIR_RP_PPPOE_SERVER}/etc/ppp \
		${IDIR_RP_PPPOE_SERVER}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/etc/ppp/pppoe-server-options \
		${IDIR_RP_PPPOE_SERVER}/etc/ppp/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pppoe-server \
		${IDIR_RP_PPPOE_SERVER}/usr/sbin/

rp-pppoe-sniff-install:
	${INSTALL_DIR} ${IDIR_RP_PPPOE_SNIFF}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pppoe-sniff \
		${IDIR_RP_PPPOE_SNIFF}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
