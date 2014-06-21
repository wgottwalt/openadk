# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXp
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		a960c831f11e6b4249fde78a5b969000
PKG_DESCR:=		x11 printing library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXext printproto
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxp
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXP,libxp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxp-install:
	${INSTALL_DIR} ${IDIR_LIBXP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXp.so* ${IDIR_LIBXP}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
