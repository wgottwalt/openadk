# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cairo
PKG_VERSION:=		1.8.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		b60a82f405f9400bbfdcf850b1728d25
PKG_DESCR:=		cairo graphics library
PKG_SECTION:=		libs
PKG_DEPENDS:=		fontconfig libfreetype libpng libx11 pixman
PKG_BUILDDEP:=		libpng pixman freetype fontconfig libX11
PKG_URL:=		http://cairographics.org/
PKG_SITES:=		http://cairographics.org/releases/

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CAIRO,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-ft=yes \
			--enable-xlib=yes

post-install:
	${INSTALL_DIR} ${IDIR_CAIRO}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcairo.so* ${IDIR_CAIRO}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
