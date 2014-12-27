# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		firefox
PKG_VERSION:=		26.0
PKG_RELEASE:=		4
PKG_HASH:=		31c4fb2792df63ae450e350380a5e18cf1c51487011a9da0b6cc4bffb69d9812
PKG_DESCR:=		graphical webbrowser
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libpthread alsa-lib glib libgtk libpng libtiff libxcursor libffi
PKG_DEPENDS+=		nspr nss libjpeg-turbo libatk pango cairo libxt libx11 libstdcxx hicolor-icon-theme
PKG_DEPENDS+=		libxdamage libxfixes libidl libsqlite libxcomposite gdk-pixbuf librt
PKG_DEPENDS+=		harfbuzz mesalib libvpx libbz2 ca-certificates libevent
PKG_BUILDDEP:=		alsa-lib glib gtk+ libIDL libX11 mesalib libtiff gdk-pixbuf
PKG_BUILDDEP+=		nspr nss libjpeg-turbo libXt fontconfig sqlite atk libpng hicolor-icon-theme
PKG_BUILDDEP+=		libvpx pango gettext-tiny bzip2 libevent bzip2-host python2-host yasm-host
PKG_BUILDDEP+=		zip-host
PKG_URL:=		http://www.mozilla.org/
PKG_SITES:=		http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${PKG_VERSION}/source/
PKG_NOPARALLEL:=	1

PKG_ARCH_DEPENDS:=	arm x86 x86_64 mips
PKG_HOST_DEPENDS:=	!netbsd !freebsd !openbsd !cygwin
PKG_SYSTEM_DEPENDS:=	tarox-pc ibm-x40 lemote-yeelong qemu-i686 qemu-x86_64 qemu-mips64el raspberry-pi

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.source.tar.bz2
WRKDIST=		${WRKDIR}/mozilla-release

include $(ADK_TOPDIR)/mk/package.mk
include $(ADK_TOPDIR)/mk/python.mk

$(eval $(call PKG_template,FIREFOX,firefox,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_DEBUG),y)
CONFIGURE_ARGS+=	--enable-debug --enable-logging
else
CONFIGURE_ARGS+=	--disable-debug --disable-logging
endif


CONFIGURE_ENV+=		CROSS_COMPILE=1 \
			PYTHON="$(PYTHON)" \
			HOST_CC="${HOST_CC}" \
			HOST_CPPFLAGS="${HOST_CPPFLAGS}" \
			HOST_CFLAGS="${HOST_CFLAGS}" \
			HOST_LDFLAGS="${HOST_LDLAGS}" \
			HOST_CXX="${HOST_CXX}" \
			HOST_CXXFLAGS="${HOST_CXXFLAGS}" \
			HOST_RANLIB="ranlib" HOST_AR="ar" \
			CPPFLAGS="-I${STAGING_TARGET_DIR}/usr/include/freetype2" \
			ac_cv_sqlite_secure_delete=yes \
			ac_cv_sqlite_threadsafe=yes \
			ac_cv_sqlite_enable_fts3=yes \
			ac_cv_sqlite_enable_unlock_notify=yes
CONFIGURE_ARGS+=	--enable-application=browser \
			--enable-official-branding \
			--with-system-zlib \
			--with-system-bz2 \
			--with-system-png \
			--with-system-cairo \
			--with-system-pixman \
			--with-system-jpeg \
			--with-system-nss \
			--with-system-nspr \
			--with-system-pango \
			--with-system-libvpx \
			--with-system-libevent=${STAGING_TARGET_DIR}/usr \
			--enable-system-ffi \
			--enable-system-sqlite \
			--disable-libnotify \
			--with-libIDL-prefix=${STAGING_TARGET_DIR}/usr \
			--with-glib-prefix=${STAGING_TARGET_DIR}/usr \
			--enable-chrome-format=jar \
			--enable-necko-protocols=all \
			--enable-libxul \
			--enable-alsa \
			--disable-pulseaudio \
			--disable-gstreamer \
			--disable-gio \
			--disable-gconf \
			--disable-accessibility \
			--disable-smil \
			--disable-dbus \
			--disable-gamepad \
			--disable-strip \
			--disable-install-strip \
			--disable-tests \
			--disable-libconic \
			--disable-static \
			--disable-gnomeui \
			--disable-gnomevfs \
			--disable-gstreamer \
			--disable-optimize \
			--disable-necko-wifi \
			--disable-svg \
			--disable-mathml \
			--disable-jemalloc \
			--disable-crashreporter \
			--disable-updater \
			--disable-xpcom-fastload \
			--disable-url-classifier \
			--disable-safe-browsing \
			--disable-elf-hack 

ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
TARGET_CFLAGS:=		$(subst Os,g3,$(TARGET_CFLAGS))
endif

XAKE_FLAGS+=		OS_RELEASE="2.6" HOST_CC=$(HOST_CC) HOST_LDFLAGS=$(HOST_LDFLAGS)
XAKE_FLAGS+=            ARCHFLAG="${TARGET_CFLAGS} ${TARGET_CPPFLAGS} ${TARGET_LDFLAGS} -lnss3 -lnssutil3 -lsmime3 -lssl3 -fPIC"

pre-build:
	-mkdir ${WRKBUILD}/js/src/.deps

firefox-install:
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/bin
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/firefox-${PKG_VERSION} \
		$(IDIR_FIREFOX)/usr/lib
	$(CP) ./files/firefox \
		$(IDIR_FIREFOX)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
