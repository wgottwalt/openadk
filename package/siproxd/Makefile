# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		siproxd
PKG_VERSION:=		0.7.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		45e5a44803181e2bf3361d562060c904
PKG_DESCR:=		a SIP (Session Initiation Protocol) proxy
PKG_SECTION:=		net
PKG_DEPENDS:=		libosip2 libpthread
PKG_URL:=		http://siproxd.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=siproxd/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SIPROXD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_SIPROXD}/usr/sbin ${IDIR_SIPROXD}/etc
	${INSTALL_DATA} ${WRKINST}/etc/siproxd.conf.example ${IDIR_SIPROXD}/etc/siproxd.conf
	${INSTALL_DATA} ${WRKINST}/etc/siproxd_passwd.cfg ${IDIR_SIPROXD}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/siproxd ${IDIR_SIPROXD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
