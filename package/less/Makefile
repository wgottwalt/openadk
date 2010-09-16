# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		less
PKG_VERSION:=		429
PKG_RELEASE:=		1
PKG_MD5SUM:=		206f2f13b9b0a35e45df660fcb6af31d
PKG_DESCR:=		A text mode pager
PKG_SECTION:=		pager
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.greenwoodsoftware.com/less/
PKG_SITES:=		http://www.greenwoodsoftware.com/less/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LESS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LESS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/less ${IDIR_LESS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
