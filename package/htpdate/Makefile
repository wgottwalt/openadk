# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		htpdate
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		82953fe72d2f40411585222f85f2afab
PKG_DESCR:=		an HTP (Hypertext Time Protocol) implementation
PKG_SECTION:=		net
PKG_URL:=		http://www.clevervest.com/twiki/bin/view/HTP
PKG_SITES:=		http://www.clevervest.com/htp/archive/c/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HTPDATE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE=		auto

do-install:
	${INSTALL_DIR} ${IDIR_HTPDATE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/htpdate ${IDIR_HTPDATE}/usr/sbin/


include ${TOPDIR}/mk/pkg-bottom.mk
