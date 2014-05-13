# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pptpd
PKG_VERSION:=		1.3.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		b38df9c431041922c997c1148bedf591
PKG_DESCR:=		Point-to-Point Tunneling Protocol (PPTP) server
PKG_SECTION:=		ppp
PKG_DEPENDS:=		ppp
PKG_URL:=		http://www.poptop.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=poptop/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc glibc

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PPTPD,pptpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		-fPIC -DSBINDIR='\\\"/usr/sbin\\\"'
FAKE_FLAGS+=		INSTALL="install"

pptpd-install:
	${INSTALL_DIR} ${IDIR_PPTPD}/etc/ppp
	${INSTALL_DIR} ${IDIR_PPTPD}/usr/sbin
	${INSTALL_DATA} ./files/pptpd.conf ${IDIR_PPTPD}/etc/
	${INSTALL_DATA} ./files/options.pptpd ${IDIR_PPTPD}/etc/ppp/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pptpd \
		${WRKINST}/usr/sbin/pptpctrl ${IDIR_PPTPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
