# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXfont
PKG_VERSION:=		1.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		bf134b9f79a7fc6507577bf5b6d4f412
PKG_DESCR:=		X font Library
PKG_SECTION:=		x11
PKG_DEPENDS:=		libfreetype
PKG_BUILDDEP+=		freetype fontcacheproto fontsproto libfontenc
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFONT,libxfont,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		V=1
CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBXFONT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXfont.so* ${IDIR_LIBXFONT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
