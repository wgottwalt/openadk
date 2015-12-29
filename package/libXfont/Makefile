# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXfont
PKG_VERSION:=		1.5.1
PKG_RELEASE:=		1
PKG_HASH:=		7c65c8ac581a162ff4c8cd86c1db9e9f425132eb65b1cba0c9e905c6cb8a45f5
PKG_DESCR:=		x11 font library
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		libfreetype
PKG_BUILDDEP:=		freetype fontcacheproto fontsproto libfontenc xtrans
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxfont
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFONT,libxfont,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		ac_cv_path_XMLTO=true

libxfont-install:
	${INSTALL_DIR} ${IDIR_LIBXFONT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXfont.so* ${IDIR_LIBXFONT}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
