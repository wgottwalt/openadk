# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tinc
PKG_VERSION:=		1.0.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		f907acebada53512e01235bea6b4cdf1
MASTER_SITES:=		http://www.tinc-vpn.org/packages/ \
			http://ftp.yi.se/pub/tinc/ \
			http://www.mirrors.wiretapped.net/security/network-security/tinc/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TINC,tinc,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-kernel=${LINUX_DIR} \
			--with-zlib=${STAGING_DIR}/usr/ \
			--with-lzo-include=${STAGING_DIR}/usr/include/lzo
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_TINC}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tincd ${IDIR_TINC}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
