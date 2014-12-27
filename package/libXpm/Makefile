# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXpm
PKG_VERSION:=		3.5.10
PKG_RELEASE:=		2
PKG_HASH:=		f73f06928a140fd2090c439d1d55c6682095044495af6bf886f8e66cf21baee5
PKG_DESCR:=		common operation for the xpm pixmap format
PKG_BUILDDEP:=		libX11 libXt
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}
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
