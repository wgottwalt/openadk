# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXfont
PKG_VERSION:=		1.4.5
PKG_RELEASE:=		2
PKG_MD5SUM:=		a54dea0debecf232a346c22e71d76836
PKG_DESCR:=		x11 font library
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		libfreetype
PKG_BUILDDEP:=		freetype fontcacheproto fontsproto libfontenc xtrans
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxfont
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFONT,libxfont,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		ac_cv_path_XMLTO=true

libxfont-install:
	${INSTALL_DIR} ${IDIR_LIBXFONT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXfont.so* ${IDIR_LIBXFONT}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
