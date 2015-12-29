# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXpm
PKG_VERSION:=		3.5.11
PKG_RELEASE:=		1
PKG_HASH:=		53ddf924441b7ed2de994d4934358c13d9abf4828b1b16e1255ade5032b31df7
PKG_DESCR:=		common operation for the xpm pixmap format
PKG_BUILDDEP:=		libX11 libXt
PKG_SECTION:=		x11/libs
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxpm
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXPM,libxpm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		ac_cv_search_gettext=no

libxpm-install:
	${INSTALL_DIR} ${IDIR_LIBXPM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXpm.so* ${IDIR_LIBXPM}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
