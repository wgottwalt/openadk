# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		pptp
PKG_VERSION:=		1.8.0
PKG_RELEASE:=		1
PKG_HASH:=		e39c42d933242a8a6dd8600a0fa7f0a5ec8f066d10c4149d8e81a5c68fe4bbda
PKG_DESCR:=		point-to-point tunneling protocol client
PKG_SECTION:=		net/ppp
PKG_DEPENDS:=		ppp
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=pptpclient/}
PKG_CFLINE_PPTP:=	select ADK_KERNEL_NET_IPGRE m@
PKG_CFLINE_PPTP+=	select ADK_KERNEL_PPP m

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PPTP,pptp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_PPTP}/sbin
	${INSTALL_DIR} ${IDIR_PPTP}/usr/sbin
	${INSTALL_DIR} ${IDIR_PPTP}/etc/ppp
	${INSTALL_BIN} ./files/ifup.pptp ${IDIR_PPTP}/sbin/ifup.pptp
	${INSTALL_DATA} ./files/options.pptp ${IDIR_PPTP}/etc/ppp/
	${INSTALL_BIN} ${WRKBUILD}/pptp ${IDIR_PPTP}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
