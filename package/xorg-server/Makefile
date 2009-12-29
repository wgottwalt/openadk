# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xorg-server
PKG_VERSION:=		1.7.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		913a672cbd6da516de15965d594e20b9
PKG_DESCR:=		Xorg server
PKG_SECTION:=		x11
PKG_DEPENDS:=		libopenssl libxfont pixman libpciaccess libxkbfile libfontenc xkeyboard-config xkbcomp
PKG_BUILDDEP+=		libX11 randrproto renderproto fixesproto damageproto scrnsaverproto resourceproto fontsproto videoproto compositeproto evieext libxkbfile libXfont pixman libpciaccess openssl xf86dgaproto
PKG_URL:=		http://www.x.org
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XORG_SERVER,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		V=1
CONFIGURE_ARGS+=	\
			--enable-dga \
			--enable-xorg \
			--enable-xv \
			--disable-aiglx \
			--disable-config-hal \
			--disable-dpms \
			--disable-dri \
			--disable-dri2 \
			--disable-glx \
			--disable-xace \
			--disable-xephyr \
			--disable-xf86bigfont \
			--disable-xf86vidmode \
			--disable-xfake \
			--disable-xfbdev \
			--disable-xinerama \
			--disable-xnest \
			--disable-xsdl \
			--disable-xselinux \
			--disable-xcsecurity \
			--disable-xvfb \
			--disable-xvmc \
			--with-xkb-output=/tmp \
			--with-os-vendor=OpenADK \
			--with-vendor-web="http://www.openadk.org"
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/usr/bin
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/usr/lib/xorg/modules/{extensions,fonts,linux,multimedia}
	${CP} ${WRKINST}/usr/bin/* $(IDIR_XORG_SERVER)/usr/bin
	${CP} ${WRKINST}/usr/lib/xorg/modules/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules
	${CP} ${WRKINST}/usr/lib/xorg/modules/extensions/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/extensions
	${CP} ${WRKINST}/usr/lib/xorg/modules/linux/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/linux
	${CP} ${WRKINST}/usr/lib/xorg/modules/multimedia/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/multimedia

include ${TOPDIR}/mk/pkg-bottom.mk
