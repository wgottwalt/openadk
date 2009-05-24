# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rp-pppoe
PKG_VERSION:=		3.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		d58a13cc4185bca6121a606ff456dec0
MASTER_SITES:=		http://www.roaringpenguin.com/files/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PPPOE_CLIENT,pppoe-client,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,PPPOE_RELAY,pppoe-relay,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,PPPOE_SERVER,pppoe-server,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,PPPOE_SNIFF,pppoe-sniff,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_func_setvbuf_reversed=no \
			ac_cv_sizeof_unsigned_short=2 \
			ac_cv_sizeof_unsigned_int=4 \
			ac_cv_sizeof_unsigned_long=4 \
			ac_cv_linux_kernel_pppoe=yes \
			ac_cv_pack_bitfields_reversed=yes
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
WRKSRC:=		${WRKDIST}/src

post-install:
	${INSTALL_DIR} ${IDIR_PPPOE_CLIENT}/etc/init.d
	${INSTALL_DIR} ${IDIR_PPPOE_CLIENT}/etc/ppp
	${INSTALL_DIR} ${IDIR_PPPOE_CLIENT}/usr/sbin
	${INSTALL_BIN} ./files/pppoe-client.init \
		${IDIR_PPPOE_CLIENT}/etc/init.d/pppoe-client
	${INSTALL_DATA} ${WRKINST}/etc/ppp/pppoe.conf ${IDIR_PPPOE_CLIENT}/etc/ppp
	${CP} ${WRKINST}/usr/sbin/pppoe ${IDIR_PPPOE_CLIENT}/usr/sbin/
	${CP} ${WRKINST}/usr/sbin/pppoe-connect ${IDIR_PPPOE_CLIENT}/usr/sbin/
	${CP} ${WRKINST}/usr/sbin/pppoe-start ${IDIR_PPPOE_CLIENT}/usr/sbin/
	${CP} ${WRKINST}/usr/sbin/pppoe-stop ${IDIR_PPPOE_CLIENT}/usr/sbin/
	${CP} ${WRKINST}/usr/sbin/pppoe-status ${IDIR_PPPOE_CLIENT}/usr/sbin/
	${CP} ${WRKINST}/usr/sbin/pppoe-setup ${IDIR_PPPOE_CLIENT}/usr/sbin/
	${INSTALL_DIR} ${IDIR_PPPOE_RELAY}/etc/init.d
	${INSTALL_DIR} ${IDIR_PPPOE_RELAY}/usr/sbin
	${INSTALL_BIN} ./files/pppoe-relay.init \
		${IDIR_PPPOE_RELAY}/etc/init.d/pppoe-relay
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pppoe-relay ${IDIR_PPPOE_RELAY}/usr/sbin/
	${INSTALL_DIR} ${IDIR_PPPOE_SERVER}/etc/init.d
	${INSTALL_DIR} ${IDIR_PPPOE_SERVER}/etc/ppp
	${INSTALL_DIR} ${IDIR_PPPOE_SERVER}/usr/sbin
	${INSTALL_BIN} ./files/pppoe-server.init \
		${IDIR_PPPOE_SERVER}/etc/init.d/pppoe-server
	${INSTALL_DATA} ${WRKINST}/etc/ppp/pppoe-server-options ${IDIR_PPPOE_SERVER}/etc/ppp/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pppoe-server ${IDIR_PPPOE_SERVER}/usr/sbin/
	${INSTALL_DIR} ${IDIR_PPPOE_SNIFF}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pppoe-sniff ${IDIR_PPPOE_SNIFF}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
