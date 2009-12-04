# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cairo
PKG_VERSION:=		1.8.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		d3e1a1035ae563812d4dd44a74fb0dd0
PKG_DESCR:=		cairo graphics library
PKG_SECTION:=		libs
PKG_DEPENDS:=		fontconfig freetype libpng libX11 pixman
PKG_URL:=		http://cairographics.org/
PKG_SITES:=		http://cairographics.org/releases/

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CAIRO,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--enable-ft=yes \
			--enable-xlib=yes
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_CAIRO}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcairo.so* ${IDIR_CAIRO}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
