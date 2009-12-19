# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		atk
PKG_VERSION:=		1.29.3
PKG_RELEASE:=		1
PKG_BUILDDEP+=		glib
PKG_MD5SUM:=		f587d9285b2d0ac35ea95acef673517c
PKG_DESCR:=		atk library
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnome.org
PKG_SITES:=		${MASTER_SITE_GNOME:=/atk/1.29/}

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ATK,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_ATK}/usr/lib
	${CP} ${WRKINST}/usr/lib/libatk-*.so* ${IDIR_ATK}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
