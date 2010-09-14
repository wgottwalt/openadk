# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXfont
PKG_VERSION:=		1.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		bf134b9f79a7fc6507577bf5b6d4f412
PKG_DESCR:=		X font Library
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		libfreetype
PKG_BUILDDEP:=		freetype fontcacheproto fontsproto libfontenc xtrans
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFONT,libxfont,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_path_XMLTO=true

post-install:
	${INSTALL_DIR} ${IDIR_LIBXFONT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXfont.so* ${IDIR_LIBXFONT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
