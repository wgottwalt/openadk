# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ssltunnel
PKG_VERSION:=		1.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		4039b50566a33a4077883ea974e476d5
MASTER_SITES:=		http://www.hsc.fr/ressources/outils/ssltunnel/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SSLTUNNEL,ssltunnel,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		BUILD_CC="${TARGET_CC}"
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
XAKE_FLAGS+=		CCOPT="${TARGET_CFLAGS}" INCLS="-I. -I${STAGING_DIR}/usr/include"

post-install:
	${INSTALL_DIR} ${IDIR_SSLTUNNEL}/usr/{bin,sbin}
	${INSTALL_BIN} ${WRKINST}/usr/bin/pppclient ${IDIR_SSLTUNNEL}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pppwho ${IDIR_SSLTUNNEL}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pppserver ${IDIR_SSLTUNNEL}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
