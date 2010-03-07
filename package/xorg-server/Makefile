# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xorg-server
PKG_VERSION:=		1.7.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		866917789c71e7616a016ad256fe9b8f
PKG_DESCR:=		Xorg server
PKG_SECTION:=		x11
PKG_DEPENDS:=		libopenssl libxfont pixman libpciaccess libxkbfile \
			libfontenc xkeyboard-config xkbcomp libxau libxaw \
			libxmu libxpm libxrender libxt libxxf86dga libxext \
			libxdmcp libxv libsm libice libx11
PKG_BUILDDEP+=		libX11 randrproto renderproto fixesproto damageproto \
			scrnsaverproto resourceproto fontsproto videoproto \
			compositeproto evieext libxkbfile libXfont pixman \
			libpciaccess openssl xf86dgaproto
PKG_URL:=		http://www.x.org
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/xserver/

CFLINE_XORG_SERVER:=	depends on ADK_TARGET_WITH_VGA

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XORG_SERVER,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		V=1
CONFIGURE_ARGS+=	\
			--with-fontdir=/usr/share/fonts/X11 \
			--enable-dga \
			--enable-xorg \
			--enable-xv \
			--enable-xaa \
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
			--with-vendor-web="http://openadk.org"

post-install:
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/etc/X11
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/usr/bin
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/usr/lib/xorg/modules/linux
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/usr/lib/xorg/modules/extensions
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/usr/lib/xorg/modules/fonts	
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/usr/lib/xorg/modules/multimedia
	${CP} ${WRKINST}/usr/lib/xorg/protocol.txt \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/
	${CP} ${WRKINST}/usr/bin/* $(IDIR_XORG_SERVER)/usr/bin
	${CP} ${WRKINST}/usr/lib/xorg/modules/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules
	${CP} ${WRKINST}/usr/lib/xorg/modules/extensions/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/extensions
	${CP} ${WRKINST}/usr/lib/xorg/modules/linux/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/linux
	${CP} ${WRKINST}/usr/lib/xorg/modules/multimedia/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/multimedia
	-$(CP) $(TOPDIR)/target/$(ADK_TARGET)/xorg.conf \
		$(IDIR_XORG_SERVER)/etc/X11

include ${TOPDIR}/mk/pkg-bottom.mk
