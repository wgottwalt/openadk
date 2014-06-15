# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cairo
PKG_VERSION:=		1.12.16
PKG_RELEASE:=		4
PKG_MD5SUM:=		a1304edcdc99282f478b995ee5f8f854
PKG_DESCR:=		cairo graphics library
PKG_SECTION:=		libs/image
PKG_DEPENDS:=		fontconfig libfreetype libpng libx11 pixman
PKG_DEPENDS+=		libxrender
PKG_BUILDDEP:=		libpng pixman freetype fontconfig libX11 libXrender glib
PKG_BUILDDEP+=		libXext
HOST_BUILDDEP:=		libpng-host pixman-host freetype-host fontconfig-host
PKG_URL:=		http://cairographics.org/
PKG_SITES:=		http://cairographics.org/releases/
PKG_OPTS:=		dev

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,CAIRO,cairo,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,CAIRO,cairo,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_CONFIGURE_ARGS+=	--enable-ft=yes \
			--enable-png=yes \
			--enable-fc=yes \
			--enable-tee=no \
			--enable-xlib=no \
			--enable-pdf=no \
			--enable-quartz=no \
			--disable-test-surfaces \
			--disable-full-testing

ifeq (,$(filter arm,$(ADK_TARGET_ARCH)))
TARGET_CFLAGS:=         $(filter-out -Os,$(TARGET_CFLAGS))
endif
CONFIGURE_ARGS+=	--enable-ft=yes \
			--enable-fc=yes \
			--enable-tee=yes \
			--enable-xlib=yes \
			--enable-pdf=yes \
			--enable-png=yes \
			--enable-quartz=no \
			--disable-test-surfaces \
			--disable-full-testing

cairo-install:
	${INSTALL_DIR} ${IDIR_CAIRO}/usr/lib/cairo
	${CP} ${WRKINST}/usr/lib/libcairo*.so* ${IDIR_CAIRO}/usr/lib
	${CP} ${WRKINST}/usr/lib/cairo/*.so* ${IDIR_CAIRO}/usr/lib/cairo

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
