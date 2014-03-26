# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fping
PKG_VERSION:=		3.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		d5e8be59e307cef76bc479e1684df705
PKG_DESCR:=		A program to ping hosts in parallel
PKG_SECTION:=		net
PKG_URL:=		http://fping.org
PKG_SITES:=		http://fping.org/dist/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FPING,fping,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

fping-install:
	${INSTALL_DIR} ${IDIR_FPING}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/fping ${IDIR_FPING}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
