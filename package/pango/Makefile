# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pango
PKG_VERSION:=		1.28.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		aa3dee16506275a36c6c9239c9e2dfdd
PKG_DESCR:=		pango library
PKG_SECTION:=		libs
PKG_URL:=		http://www.pango.org
PKG_SITES:=		${MASTER_SITE_GNOME:=/pango/1.28/}

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PANGO,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_PANGO}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpango*.so* ${IDIR_PANGO}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
