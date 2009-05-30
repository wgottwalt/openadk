# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		scdp
PKG_VERSION:=		1.0b
PKG_RELEASE:=		1
PKG_MD5SUM:=		7eafaf5a422e37d04715613993ed5d95
PKG_DESCR:=		An utility to send CDP (Cisco Discovery Protocol) packets.
PKG_SECTION:=		net
PKG_DEPENDS:=		libnet
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=scdp/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SCDP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_path_libnet_config=${STAGING_DIR}/usr/bin
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_SCDP}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/scdp ${IDIR_SCDP}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
