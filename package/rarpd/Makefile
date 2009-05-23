# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rarpd
PKG_VERSION:=		1.1
PKG_RELEASE:=		10
PKG_MD5SUM:=		04e2ca849e758d0b88c8281775ec3b58
MASTER_SITES:=		ftp://ftp.dementia.org/pub/net-tools/

# Hack Alert!
# The configure script for rarpd, when used with the --with-libnet option
# doesn't correctly detect and set -DNEW_LIBNET_INTERFACE.
EXTRA_CFLAGS=		-DNEW_LIBNET_INTERFACE

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RARPD,rarpd,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-libnet="${STAGING_DIR}/usr" \
			--with-pcap="${STAGING_DIR}/usr"
TCFLAGS+=		${EXTRA_CFLAGS}
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_RARPD}/usr/sbin
	${INSTALL_DIR} ${IDIR_RARPD}/etc/init.d
	${INSTALL_BIN} ${WRKINST}/sbin/rarpd ${IDIR_RARPD}/usr/sbin/
	${INSTALL_BIN} ./files/rarpd.init ${IDIR_RARPD}/etc/init.d/rarpd

include ${TOPDIR}/mk/pkg-bottom.mk
