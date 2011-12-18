# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xorg-server
PKG_VERSION:=		1.9.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		b8e364bffd87291b593726696d39b4b5
PKG_DESCR:=		Xorg server
PKG_SECTION:=		x11/server
PKG_DEPENDS:=		libopenssl libxfont pixman libpciaccess libxkbfile
PKG_DEPENDS+=		libfontenc xkeyboard-config xkbcomp libxau libxaw
PKG_DEPENDS+=		libxmu libxpm libxrender libxt libxxf86dga libxext
PKG_DEPENDS+=		libxdmcp libxv libsm libice libx11 libxcb
PKG_BUILDDEP:=		libX11 randrproto renderproto fixesproto damageproto
PKG_BUILDDEP+=		scrnsaverproto resourceproto fontsproto videoproto
PKG_BUILDDEP+=		compositeproto evieext libxkbfile libXfont pixman
PKG_BUILDDEP+=		libpciaccess openssl xf86dgaproto recordproto
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_NEED_CXX:=		1

PKG_SUBPKGS:=		XORG_SERVER XORG_SERVER_DEV
PKGSD_XORG_SERVER_DEV:=	Xorg server development files
PKGSC_XORG_SERVER_DEV:=	x11/devel

PKG_CFLINE_XORG_SERVER:=depends on ADK_TARGET_WITH_VGA
PKG_ARCH_DEPENDS:=	!cris !avr32

PKG_FLAVOURS_XORG_SERVER:=	WITH_DRI WITH_KDRIVE
PKGFS_WITH_DRI:=		mesalib
PKGFD_WITH_DRI:=		enable DRI/DRI2 support
PKGFB_WITH_DRI:=		xf86driproto glproto dri2proto MesaLib
PKGFD_WITH_KDRIVE:=		Build Kdrive Xfbdev server

PKG_CHOICES_XORG_SERVER:=	WITH_GCRYPT WITH_CRYPTO
PKGCD_WITH_GCRYPT:=		use libgcrypt for SHA1
PKGCS_WITH_GCRYPT:=		libgcrypt
PKGCB_WITH_GCRYPT:=		libgcrypt
PKGCD_WITH_CRYPTO:=		use openssl libcrypto for SHA1
PKGCS_WITH_CRYPTO:=		libopenssl
PKGCB_WITH_CRYPTO:=		openssl

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XORG_SERVER,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,XORG_SERVER_DEV,${PKG_NAME}-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_XORG_SERVER_DEV},${PKGSC_XORG_SERVER_DEV}))

ifeq (${ADK_PACKAGE_XORG_SERVER_WITH_GCRYPT},y)
CONFIGURE_ARGS+=	 --with-sha1=libgcrypt
endif

ifeq (${ADK_PACKAGE_XORG_SERVER_WITH_CRYPTO},y)
CONFIGURE_ARGS+=	 --with-sha1=libcrypto
endif

CONFIGURE_ENV+=		V=1
CONFIGURE_ARGS+=	--enable-dga \
			--enable-xorg \
			--enable-xv \
			--enable-xaa \
			--enable-vgahw \
			--enable-dpms \
			--disable-aiglx \
			--disable-config-hal \
			--disable-config-udev \
			--disable-xace \
			--disable-xephyr \
			--disable-xf86bigfont \
			--disable-xf86vidmode \
			--disable-xfake \
			--disable-xinerama \
			--disable-xnest \
			--disable-xselinux \
			--disable-xcsecurity \
			--disable-xvfb \
			--disable-xvmc \
			--with-xkb-output=/tmp \
			--with-os-vendor=OpenADK \
			--with-vendor-web="http://openadk.org"

ifeq (${ADK_PACKAGE_XORG_SERVER_WITH_KDRIVE},y)
CONFIGURE_ARGS+=	--enable-kdrive --enable-xfbdev --enable-kdrive-kbd --enable-kdrive-mouse --enable-kdrive-evdev
else
CONFIGURE_ARGS+=	--disable-kdrive --disable-xfbdev
endif

ifeq (${ADK_PACKAGE_XORG_SERVER_WITH_DRI},y)
CONFIGURE_ARGS+=	--enable-dri --enable-dri2 --enable-glx
else
CONFIGURE_ARGS+=	--disable-dri --disable-dri2 --disable-glx
endif

ifeq (${ADK_TARGET_SYSTEM_LEMOTE_YEELONG},y)
CONFIGURE_ARGS+=	--with-int10=stub
endif

xorg-server-install:
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/etc/X11
	$(INSTALL_DIR) $(IDIR_XORG_SERVER)/usr/bin
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
	${CP} ${WRKINST}/usr/lib/xorg/modules/multimedia/*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/multimedia
ifeq (${ADK_TARGET_SYSTEM_LEMOTE_YEELONG},y)
	${CP} ./files/xorg.conf.lemote-yeelong \
		$(IDIR_XORG_SERVER)/etc/X11/xorg.conf
endif
ifeq (${ADK_TARGET_SYSTEM_SHARP_ZAURUS},y)
	${CP} ./files/xorg.conf.sharp-zaurus \
		$(IDIR_XORG_SERVER)/etc/X11/xorg.conf
endif
ifeq (${ADK_PACKAGE_XORG_SERVER_WITH_DRI},y)
	${CP} ${WRKINST}/usr/lib/xorg/modules/extensions/*dri*.so \
		$(IDIR_XORG_SERVER)/usr/lib/xorg/modules/extensions
endif

xorg-server-dev-install:
	$(INSTALL_DIR) $(IDIR_XORG_SERVER_DEV)/usr/include/xorg
	${CP} ${WRKINST}/usr/include/xorg/* \
		$(IDIR_XORG_SERVER_DEV)/usr/include/xorg
	$(INSTALL_DIR) $(IDIR_XORG_SERVER_DEV)/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/xorg-server.pc \
		$(IDIR_XORG_SERVER_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
