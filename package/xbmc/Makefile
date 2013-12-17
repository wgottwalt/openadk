# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xbmc
PKG_VERSION:=		12.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		489f3877decae4e265ece54f9eaef0ba
PKG_DESCR:=		software media player
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		boost libffmpeg python2 libstdcxx bcm2835-vc
PKG_DEPENDS+=		libglew mesalib libass libmpeg2 libmad dbus
PKG_DEPENDS+=		libjpeg libogg libvorbis libmodplug libcurl
PKG_DEPENDS+=		libflac libopenssl libbz2 libtiff liblzo
PKG_DEPENDS+=		yajl tinyxml libsqlite libpcrecpp libpng
PKG_DEPENDS+=		libpcre libcdio libfreetype libsamplerate
PKG_DEPENDS+=		taglib libjasper libmp3lame libmicrohttpd
PKG_DEPENDS+=		omxplayer libusb-compat libbluray libgpg-error
PKG_BUILDDEP:=		autotool boost ffmpeg python2 MesaLib libglew libass
PKG_BUILDDEP+=		libmpeg2 libmad jpeg libogg libvorbis libmodplug
PKG_BUILDDEP+=		curl flac openssl bzip2 libtiff liblzo yajl
PKG_BUILDDEP+=		tinyxml sqlite pcre libpng libcdio freetype 
PKG_BUILDDEP+=		libsamplerate taglib libjasper lame libmicrohttpd
PKG_BUILDDEP+=		bcm2835-vc libgpg-error dbus libusb-compat libbluray
PKG_BUILDDEP+=		libgpg-error
PKG_URL:=		http://xbmc.org/
PKG_SITES:=		http://mirrors.xbmc.org/releases/source/

PKG_SYSTEM_DEPENDS:=	raspberry-pi
PKG_LIBC_DEPENDS:=	eglibc glibc musl

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XBMC,xbmc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		V=1 TIXML_USE_STL=1
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
TARGET_CPPFLAGS+=	-I$(STAGING_DIR)/usr/include/boost-1_54 \
			-DTIXML_USE_STL=1 \
			-I$(STAGING_DIR)/opt/vc/include \
			-I$(STAGING_DIR)/opt/vc/include/interface/vcos/pthreads \
			-I$(STAGING_DIR)/opt/vc/include/interface/vmcs_host/linux
TARGET_LDFLAGS+=	-L$(STAGING_DIR)/opt/vc/lib -lkhrn_static
AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-optical-drive \
			--disable-ssh \
			--disable-samba \
			--disable-mysql \
			--enable-libusb \
			--enable-libbluray \
			--enable-external-libraries \
			--enable-player=omxplayer \
			--enable-gles \
			--disable-sdl \
			--disable-joystick \
			--disable-x11 \
			--with-platform=raspberry-pi

post-extract:
	(cd $(WRKDIR) && ${BASH} $(TOPDIR)/scripts/xbmc-fix.sh)

xbmc-install:
	$(INSTALL_DIR) $(IDIR_XBMC)/usr/lib/xbmc
	$(CP) $(WRKINST)/usr/lib/xbmc/* \
		$(IDIR_XBMC)/usr/lib/xbmc
	$(INSTALL_DIR) $(IDIR_XBMC)/usr/share/xbmc
	$(CP) $(WRKINST)/usr/share/xbmc/* \
		$(IDIR_XBMC)/usr/share/xbmc
	$(INSTALL_DIR) $(IDIR_XBMC)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xbmc \
		$(IDIR_XBMC)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
