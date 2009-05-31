# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xorg-server
PKG_VERSION:=		1.5.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		7aca5d0dc8b824d3dff6140e381e03df
PKG_DESCR:=		Xorg server
PKG_SECTION:=		x11
PKG_DEPENDS:=		libopenssl
PKG_URL:=		http://www.x.org
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XORG_SERVER,xorg-server,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-xinerama \
			--disable-aiglx \
			--disable-dga \
			--disable-dri \
			--disable-glx \
			--disable-xnest \
			--disable-config-hal \
			--disable-xvfb \
			--disable-mfb \
			--disable-cfb \
			--disable-afb \
			--disable-xephyr \
			--disable-xsdl \
			--enable-freetype \
			--disable-kdrive-vesa \
			--disable-xfbdev \
			--disable-xfake \
			--disable-xsdl \
			--disable-afb \
			--disable-cfb \
			--disable-mfb \
			--disable-xnest \
			--disable-xvfb \
			--disable-xf86bigfont \
			--disable-glx \
			--disable-aiglx \
			--enable-xv \
			--disable-xvmc \
			--disable-dri \
			--disable-xace \
			--disable-xephyr \
			--with-xkb-output=/tmp \
			--with-os-vendor=OpenADK \
			--with-vendor-web="http://www.openadk.org" \
			--enable-builtin-fonts
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/usr/bin
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/usr/lib/xorg/modules/{extensions,fonts,linux,multimedia}
	${CP} ${WRKINST}/usr/bin/* $(IDIR_XORG_SERVER)/usr/bin
	${CP} ${WRKINST}/usr/lib/xorg/modules/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules
	${CP} ${WRKINST}/usr/lib/xorg/modules/extensions/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/extensions
	${CP} ${WRKINST}/usr/lib/xorg/modules/fonts/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/fonts
	${CP} ${WRKINST}/usr/lib/xorg/modules/linux/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/linux
	${CP} ${WRKINST}/usr/lib/xorg/modules/multimedia/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/multimedia

include ${TOPDIR}/mk/pkg-bottom.mk
