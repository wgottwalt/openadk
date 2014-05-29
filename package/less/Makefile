# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		less
PKG_VERSION:=		436
PKG_RELEASE:=		1
PKG_MD5SUM:=		817bf051953ad2dea825a1cdf460caa4
PKG_DESCR:=		text mode pager
PKG_SECTION:=		app/editor
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.greenwoodsoftware.com/less/
PKG_SITES:=		http://www.greenwoodsoftware.com/less/
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LESS,less,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

less-install:
	${INSTALL_DIR} ${IDIR_LESS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/less ${IDIR_LESS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
