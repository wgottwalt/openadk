# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		atk
PKG_VERSION:=		2.11.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		2b4316e69cbe0a1998ba39cdc8c89692
PKG_DESCR:=		atk library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		glib
PKG_URL:=		http://www.gnome.org/
PKG_SITES:=		${MASTER_SITE_GNOME:=/atk/2.11/}
PKG_LIBNAME:=		libatk
PKG_OPTS:=		dev

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBATK,libatk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libatk-install:
	${INSTALL_DIR} ${IDIR_LIBATK}/usr/lib
	${CP} ${WRKINST}/usr/lib/libatk-*.so* ${IDIR_LIBATK}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
