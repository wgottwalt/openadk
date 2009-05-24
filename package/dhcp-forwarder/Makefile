# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dhcp-forwarder
PKG_VERSION:=		0.7
PKG_RELEASE:=		12
PKG_MD5SUM:=		e7f876e615ebc3f96418f6477b4451e2
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
MASTER_SITES:=		http://savannah.nongnu.org/download/dhcp-fwd/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DHCP_FORWARDER,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull="yes"
CONFIGURE_ARGS+=	--disable-dietlibc
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
XAKE_FLAGS+=		cfg_filename="/etc/dhcp-fwd.conf"

post-install:
	${INSTALL_DIR} ${IDIR_DHCP_FORWARDER}/etc/init.d
	${INSTALL_DIR} ${IDIR_DHCP_FORWARDER}/usr/sbin
	${INSTALL_DATA} ${WRKBUILD}/contrib/dhcp-fwd.conf \
		${IDIR_DHCP_FORWARDER}/etc/
	${INSTALL_BIN} ./files/dhcp-fwd.init \
		${IDIR_DHCP_FORWARDER}/etc/init.d/dhcp-fwd
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dhcp-fwd \
		${IDIR_DHCP_FORWARDER}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
