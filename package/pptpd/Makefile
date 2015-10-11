# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		pptpd
PKG_VERSION:=		1.3.4
PKG_RELEASE:=		2
PKG_HASH:=		c23a9bdd219a0a36ae7ca20e7c9749f2efdcdbf108aabeeeb5066ba442ec88b6
PKG_DESCR:=		point-to-point tunneling protocol server
PKG_SECTION:=		net/ppp
PKG_DEPENDS:=		ppp
PKG_URL:=		http://www.poptop.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=poptop/}
PKG_CFLINE_PPTPD:=	select ADK_KERNEL_NET_IPGRE m@
PKG_CFLINE_PPTPD+=	select ADK_KERNEL_PPP m@
PKG_CFLINE_PPTPD+=	select ADK_KERNEL_PPP_MPPE m

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc-ng glibc

include ${ADK_TOPDIR}/mk/package.mk

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
