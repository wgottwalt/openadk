# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		vrrpd
PKG_VERSION:=		1.0
PKG_RELEASE:=		9
PKG_MD5SUM:=		6d5066ea1a6ced817376ca0f54765447
PKG_DESCR:=		virtual router redundancy protocol daemon
PKG_SECTION:=		net/route
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=vrrpd/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VRRPD,vrrpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

MAKE_FLAGS:=		CC="${TARGET_CC}" \
			DBG_OPT="" \
			MAIN_OPT="${TARGET_CFLAGS}"
ALL_TARGET:=		vrrpd

do-install:
	${INSTALL_DIR} ${IDIR_VRRPD}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/vrrpd ${IDIR_VRRPD}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
