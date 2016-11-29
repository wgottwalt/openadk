# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXfont2
PKG_VERSION:=		2.0.1
PKG_RELEASE:=		1
PKG_HASH:=		381b6b385a69343df48a082523c856aed9042fbbc8ee0a6342fb502e4321230a
PKG_DESCR:=		x11 font library (v2)
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		libfreetype
PKG_BUILDDEP:=		freetype fontcacheproto fontsproto libfontenc xtrans
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxfont2
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFONT2,libxfont2,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		ac_cv_path_XMLTO=true

libxfont2-install:
	${INSTALL_DIR} ${IDIR_LIBXFONT2}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXfont2.so* ${IDIR_LIBXFONT2}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
