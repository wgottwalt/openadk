# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		htpdate
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		a3da5ad8965345eb734695c765010acf
PKG_DESCR:=		an HTP (Hypertext Time Protocol) implementation
PKG_SECTION:=		net
PKG_URL:=		http://www.vervest.org/htp/
PKG_SITES:=		http://www.clevervest.com/htp/archive/c/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HTPDATE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

post-install:
	${INSTALL_DIR} ${IDIR_HTPDATE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/htpdate ${IDIR_HTPDATE}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
