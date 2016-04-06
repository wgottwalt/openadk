# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		cairo
PKG_VERSION:=		1.14.6
PKG_RELEASE:=		1
PKG_HASH:=		613cb38447b76a93ff7235e17acd55a78b52ea84a9df128c3f2257f8eaa7b252
PKG_DESCR:=		graphics library
PKG_SECTION:=		libs/image
PKG_DEPENDS:=		fontconfig libfreetype libx11 pixman
PKG_DEPENDS+=		libxrender
PKG_BUILDDEP:=		pixman freetype fontconfig libX11 libXrender glib
PKG_BUILDDEP+=		libXext
HOST_BUILDDEP:=		libpng-host pixman-host freetype-host fontconfig-host
PKG_URL:=		http://cairographics.org/
PKG_SITES:=		http://cairographics.org/releases/
PKG_OPTS:=		dev

PKG_FLAVOURS_CAIRO:=	WITH_PS WITH_PDF WITH_XML WITH_PNG WITH_TEE WITH_SVG WITH_XRENDER
PKGFD_WITH_PS:=		postscript support
PKGFD_WITH_PDF:=	pdf support
PKGFD_WITH_XML:=	xml support
PKGFD_WITH_PNG:=	png support
PKGFB_WITH_PNG:=	libpng
PKGFS_WITH_PNG:=	libpng
PKGFD_WITH_TEE:=	tee support
PKGFD_WITH_SVG:=	svg support
PKGFD_WITH_XRENDER:=	xorg xrender support

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,CAIRO,cairo,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,CAIRO,cairo,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--enable-ft=yes \
			--enable-png=yes \
			--enable-fc=yes \
			--enable-tee=no \
			--enable-xlib=no \
			--enable-pdf=no \
			--enable-quartz=no \
			--disable-test-surfaces \
			--disable-full-testing

ifneq ($(ADK_PACKAGE_CAIRO_WITH_XRENDER),)
CONFIGURE_ARGS+=	--enable-xlib-xrender=yes
else
CONFIGURE_ARGS+=	--enable-xlib-xrender=no
endif
ifneq ($(ADK_PACKAGE_CAIRO_WITH_SVG),)
CONFIGURE_ARGS+=	--enable-svg=yes \
			--enable-png=yes
else
CONFIGURE_ARGS+=	--enable-svg=no
endif
ifneq ($(ADK_PACKAGE_CAIRO_WITH_PDF),)
CONFIGURE_ARGS+=	--enable-pdf=yes
else
CONFIGURE_ARGS+=	--enable-pdf=no
endif
ifneq ($(ADK_PACKAGE_CAIRO_WITH_PS),)
CONFIGURE_ARGS+=	--enable-ps=yes
else
CONFIGURE_ARGS+=	--enable-ps=no
endif
ifneq ($(ADK_PACKAGE_CAIRO_WITH_PNG)$(ADK_PACKAGE_CAIRO_WITH_SVG),)
CONFIGURE_ARGS+=	--enable-png=yes
else
CONFIGURE_ARGS+=	--enable-png=no
endif
ifneq ($(ADK_PACKAGE_CAIRO_WITH_XML),)
CONFIGURE_ARGS+=	--enable-xml=yes
else
CONFIGURE_ARGS+=	--enable-xml=no
endif
ifneq ($(ADK_PACKAGE_CAIRO_WITH_TEE),)
CONFIGURE_ARGS+=	--enable-tee=yes
else
CONFIGURE_ARGS+=	--enable-tee=no
endif

CONFIGURE_ARGS+=	--enable-ft=yes \
			--enable-fc=yes \
			--enable-xlib=yes \
			--enable-quartz=no \
			--disable-test-surfaces \
			--disable-full-testing

cairo-install:
	${INSTALL_DIR} ${IDIR_CAIRO}/usr/lib/cairo
	${CP} ${WRKINST}/usr/lib/libcairo*.so* ${IDIR_CAIRO}/usr/lib
	${CP} ${WRKINST}/usr/lib/cairo/*.so* ${IDIR_CAIRO}/usr/lib/cairo

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
