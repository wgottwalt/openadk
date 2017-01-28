# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		firefox
PKG_VERSION:=		50.1.0
PKG_RELEASE:=		1
PKG_HASH:=		54bb9bccbf9eed0c7715ae7f45330bf41ce24b756f5fdecb380e06709a6ac5a4
PKG_DESCR:=		graphical webbrowser
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		alsa-lib glib libgtk2 libgtk3 libpng libtiff libxcursor libffi
PKG_DEPENDS+=		nspr nss libjpeg-turbo libatk pango cairo libxt libx11 hicolor-icon-theme
PKG_DEPENDS+=		libxdamage libxfixes libidl libsqlite libxcomposite gdk-pixbuf libdbus
PKG_DEPENDS+=		harfbuzz mesa libvpx libbz2 ca-certificates libevent at-spi2-atk at-spi2-core
PKG_BUILDDEP:=		alsa-lib glib libgtk2 libgtk3 libIDL libX11 mesa libtiff gdk-pixbuf
PKG_BUILDDEP+=		nspr nss libjpeg-turbo libXt fontconfig sqlite atk libpng hicolor-icon-theme
PKG_BUILDDEP+=		libvpx pango bzip2 libevent bzip2-host python2-host yasm-host
PKG_BUILDDEP+=		zip-host autoconf-old-host
PKG_NEEDS:=		threads c++ intl
PKG_URL:=		http://www.mozilla.org/
PKG_SITES:=		http://releases.mozilla.org/pub/mozilla.org/firefox/releases/$(PKG_VERSION)/source/

PKG_CFLINE_FIREFOX:=	select ADK_PACKAGE_CAIRO_WITH_TEE@
PKG_CFLINE_FIREFOX+=	select ADK_PACKAGE_CAIRO_WITH_XRENDER

PKG_ARCH_DEPENDS:=	arm mips mips64 x86 x86_64
PKG_SYSTEM_DEPENDS:=	solidrun-imx6 ibm-x40 lemote-yeelong qemu-i686 qemu-x86_64 raspberry-pi raspberry-pi2 raspberry-pi3

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).source.tar.xz
WRKBUILD=		$(WRKDIR)/$(PKG_NAME)-obj

include $(ADK_TOPDIR)/mk/package.mk
include $(ADK_TOPDIR)/mk/python.mk

$(eval $(call PKG_template,FIREFOX,firefox,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		minimal
ifeq ($(ADK_DEBUG),y)
CONFIGURE_ARGS+=	--enable-debug
else
CONFIGURE_ARGS+=	--disable-debug
endif

CONFIGURE_ENV+=		CROSS_COMPILE=1 \
			OS_ARCH=Linux \
			OS_TARGET=Linux \
			OS_TEST="$(ADK_TARGET_ARCH)" \
			OS_CXXFLAGS="$(TARGET_CXXFLAGS)" \
			PYTHON="$(PYTHON)" \
			HOST_CC="$(HOST_CC)" \
			HOST_CPPFLAGS="$(HOST_CPPFLAGS)" \
			HOST_CFLAGS="$(HOST_CFLAGS)" \
			HOST_LDFLAGS="$(HOST_LDLAGS)" \
			HOST_CXX="$(HOST_CXX)" \
			HOST_CXXFLAGS="$(HOST_CXXFLAGS)" \
			HOST_RANLIB="ranlib" \
			HOST_AR="ar" \
			ac_cv_sqlite_secure_delete=yes \
			ac_cv_sqlite_threadsafe=yes \
			ac_cv_sqlite_enable_fts3=yes \
			ac_cv_sqlite_enable_unlock_notify=yes \
			ac_cv_sqlite_dbstat_vtab=yes
CONFIGURE_ARGS+=	--prefix=/usr \
			--target=$(GNU_TARGET_NAME) \
			--with-toolchain-prefix=$(GNU_TARGET_NAME)- \
			--enable-application=browser \
			--enable-official-branding \
			--with-system-zlib \
			--with-system-bz2 \
			--with-system-png \
			--with-system-cairo \
			--with-system-pixman \
			--with-system-jpeg \
			--with-system-nss \
			--with-system-nspr \
			--with-system-libvpx \
			--with-system-libevent=$(STAGING_TARGET_DIR)/usr \
			--disable-tree-freetype \
			--enable-system-ffi \
			--enable-system-sqlite \
			--enable-chrome-format=jar \
			--enable-necko-protocols=all \
			--enable-alsa \
			--disable-profiling \
			--disable-jprof \
			--disable-systrace \
			--disable-pulseaudio \
			--disable-gio \
			--disable-gold \
			--disable-gconf \
			--disable-accessibility \
			--disable-dbus \
			--disable-gamepad \
			--disable-strip \
			--disable-install-strip \
			--disable-tests \
			--disable-gnomeui \
			--disable-optimize \
			--disable-necko-wifi \
			--disable-jemalloc \
			--disable-crashreporter \
			--disable-printing \
			--disable-pie \
			--disable-updater \
			--disable-url-classifier \
			--disable-safe-browsing \
			--disable-elf-hack 

ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
CONFIGURE_ARGS+=	--disable-ion \
			--disable-webrtc
TARGET_CFLAGS:=		$(subst Os,g3,$(TARGET_CFLAGS))
else
CONFIGURE_ARGS+=	--enable-webrtc
endif

XAKE_FLAGS+=		CROSS_COMPILE=1 OS_ARCH="Linux" OS_TEST="$(ADK_TARGET_ARCH)" OS_RELEASE="2.6" 
XAKE_FLAGS+=		HOST_CC=$(HOST_CC) HOST_LDFLAGS=$(HOST_LDFLAGS)
XAKE_FLAGS+=            ARCHFLAG="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_LDFLAGS) -lnss3 -lnssutil3 -lsmime3 -lssl3 -fPIC"

pre-configure:
	$(SED) '/^freetype\/ftcache.h/a freetype\/ftfntfmt.h' $(WRKSRC)/config/system-headers

post-configure:
	touch $(WRKSRC)/configure
	touch $(WRKBUILD)/config.status

firefox-install:
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/bin
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/firefox-$(PKG_VERSION) \
		$(IDIR_FIREFOX)/usr/lib
	$(INSTALL_BIN) ./files/firefox \
		$(IDIR_FIREFOX)/usr/bin
ifeq ($(ADK_APPLIANCE_FIREFOX),y)
	$(INSTALL_DIR) $(IDIR_FIREFOX)/etc
	$(CP) ./files/xinitrc \
		$(IDIR_FIREFOX)/etc
endif

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
