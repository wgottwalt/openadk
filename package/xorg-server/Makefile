# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xorg-server
PKG_VERSION:=		1.7.6
PKG_RELEASE:=		2
PKG_MD5SUM:=		ba0360b4ec1f6e541b264e45906bf5f2
PKG_DESCR:=		Xorg server
PKG_SECTION:=		x11/server
PKG_DEPENDS:=		libopenssl libxfont pixman libpciaccess libxkbfile
PKG_DEPENDS+=		libfontenc xkeyboard-config xkbcomp libxau libxaw
PKG_DEPENDS+=		libxmu libxpm libxrender libxt libxxf86dga libxext
PKG_DEPENDS+=		libxdmcp libxv libsm libice libx11
PKG_BUILDDEP:=		libX11 randrproto renderproto fixesproto damageproto
PKG_BUILDDEP+=		scrnsaverproto resourceproto fontsproto videoproto
PKG_BUILDDEP+=		compositeproto evieext libxkbfile libXfont pixman
PKG_BUILDDEP+=		libpciaccess openssl xf86dgaproto
PKG_URL:=		http://www.x.org/
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/xserver/

PKG_TARGET_DEPENDS:=	!foxboard
PKG_CFLINE_XORG_SERVER:=depends on ADK_TARGET_WITH_VGA

PKG_FLAVOURS:=		WITH_DRI
PKGFS_WITH_DRI:=	mesalib
PKGFD_WITH_DRI:=	enable DRI/DRI2 support
PKGFB_WITH_DRI:=	xf86driproto glproto dri2proto MesaLib

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XORG_SERVER,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		V=1
CONFIGURE_ARGS+=	\
			--with-fontdir=/usr/share/fonts/X11 \
			--enable-dga \
			--enable-xorg \
			--enable-xv \
			--enable-xaa \
			--enable-vgahw \
			--enable-dpms \
			--disable-aiglx \
			--disable-config-hal \
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

ifeq (${ADK_PACKAGE_XORG_SERVER_WITH_DRI},y)
CONFIGURE_ARGS+=	--enable-dri --enable-dri2 --enable-glx
else
CONFIGURE_ARGS+=	--disable-dri --disable-dri2 --disable-glx
endif

ifeq (${ADK_HARDWARE_LEMOTE_YEELONG},y)
CONFIGURE_ARGS+=	--with-int10=stub
endif

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
ifeq (${ADK_PACKAGE_XORG_SERVER_WITH_DRI},y)
	${CP} ${WRKINST}/usr/lib/xorg/modules/extensions/*dri*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/extensions
endif

include ${TOPDIR}/mk/pkg-bottom.mk
