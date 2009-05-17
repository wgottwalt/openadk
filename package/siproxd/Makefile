# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		siproxd
PKG_VERSION:=		0.5.12
PKG_RELEASE:=		8
PKG_MD5SUM:=		2fa02bd6f83070593bfc2d383ce614fa
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=siproxd/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SIPROXD,siproxd,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_SIPROXD}/etc/init.d
	${INSTALL_DIR} ${IDIR_SIPROXD}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/etc/siproxd.conf.example ${IDIR_SIPROXD}/etc/siproxd.conf
	${INSTALL_DATA} ${WRKINST}/etc/siproxd_passwd.cfg ${IDIR_SIPROXD}/etc/
	${INSTALL_BIN} files/siproxd.init \
		       ${IDIR_SIPROXD}/etc/init.d/siproxd
	${INSTALL_BIN} ${WRKINST}/usr/sbin/siproxd ${IDIR_SIPROXD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
