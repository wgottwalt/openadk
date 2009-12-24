# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		less
PKG_VERSION:=		429
PKG_RELEASE:=		1
PKG_BUILDDEP+=		ncurses
PKG_MD5SUM:=		206f2f13b9b0a35e45df660fcb6af31d
PKG_DESCR:=		A text mode pager
PKG_SECTION:=		text
PKG_DEPENDS:=		libncurses
PKG_URL:=		http://www.greenwoodsoftware.com/less
PKG_SITES:=		http://www.greenwoodsoftware.com/less/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LESS,less,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto

do-install:
	${INSTALL_DIR} ${IDIR_LESS}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/less ${IDIR_LESS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
