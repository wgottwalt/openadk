# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pptpd
PKG_VERSION:=		1.3.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		b38df9c431041922c997c1148bedf591
PKG_DESCR:=		a Point-to-Point Tunneling Protocol (PPTP) server
PKG_SECTION:=		ppp
PKG_DEPENDS:=	 	ppp kmod-crypto kmod-mppe kmod-ppp
PKG_URL:=		http://www.poptop.org
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=poptop/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PPTPD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-fPIC -DSBINDIR='\\\"/usr/sbin\\\"'
FAKE_FLAGS+=		INSTALL="install"

post-install:
	${INSTALL_DIR} ${IDIR_PPTPD}/etc/ppp
	${INSTALL_DIR} ${IDIR_PPTPD}/usr/sbin
	${INSTALL_DATA} ./files/pptpd.conf ${IDIR_PPTPD}/etc/
	${INSTALL_DATA} ./files/options.pptpd ${IDIR_PPTPD}/etc/ppp/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pptpd \
		${WRKINST}/usr/sbin/pptpctrl ${IDIR_PPTPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
