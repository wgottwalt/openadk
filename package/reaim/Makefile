# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		reaim
PKG_VERSION:=		0.8
PKG_RELEASE:=		9
PKG_MD5SUM:=		647d2ab72ec454f89294accfb3182c09
PKG_DESCR:=		transparent aim / msn proxy
PKG_SECTION:=		app/chat
PKG_DEPENDS:=		iptables
PKG_URL:=		http://reaim.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=reaim/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,REAIM,reaim,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual

reaim-install:
	${INSTALL_DIR} ${IDIR_REAIM}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/reaim ${IDIR_REAIM}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
