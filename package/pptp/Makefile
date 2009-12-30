# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pptp
PKG_VERSION:=		1.6.0
PKG_RELEASE:=		3
PKG_MD5SUM:=		9a706327fb9827541d7c86d48ceb9631
PKG_DESCR:=		a Point-to-Point Tunneling Protocol (PPTP) client
PKG_SECTION:=		net
PKG_DEPENDS:=		ppp kmod-net-ipgre
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=pptpclient/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PPTP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC="${TARGET_CC}" \
			CFLAGS="${TARGET_CFLAGS}"

do-install:
	${INSTALL_DIR} ${IDIR_PPTP}/sbin
	${INSTALL_DIR} ${IDIR_PPTP}/usr/sbin
	${INSTALL_DIR} ${IDIR_PPTP}/etc/ppp
	${INSTALL_BIN} ./files/ifup.pptp ${IDIR_PPTP}/sbin/ifup.pptp
	${INSTALL_DATA} ./files/options.pptp ${IDIR_PPTP}/etc/ppp/
	${INSTALL_BIN} ${WRKBUILD}/pptp ${IDIR_PPTP}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
