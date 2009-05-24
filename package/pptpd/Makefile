# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pptpd
PKG_VERSION:=		1.3.0
PKG_RELEASE:=		9
PKG_MD5SUM:=		75d494e881f7027f4e60b114163f6b67
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=poptop/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PPTPD,pptpd,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
TCFLAGS+=		-DSBINDIR=\\\"/usr/sbin\\\"
FAKE_FLAGS+=		INSTALL="install"

post-install:
	${INSTALL_DIR} ${IDIR_PPTPD}/etc
	${INSTALL_DIR} ${IDIR_PPTPD}/etc/init.d
	${INSTALL_DIR} ${IDIR_PPTPD}/etc/ppp
	${INSTALL_DIR} ${IDIR_PPTPD}/usr/sbin
	${INSTALL_DATA} ./files/pptpd.conf ${IDIR_PPTPD}/etc/
	${INSTALL_BIN} ./files/pptpd.init \
		${IDIR_PPTPD}/etc/init.d/pptpd
	${INSTALL_DATA} ./files/options.pptpd ${IDIR_PPTPD}/etc/ppp/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pptpd \
		${WRKINST}/usr/sbin/pptpctrl ${IDIR_PPTPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
