# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		firefox
PKG_VERSION:=		5.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		6d1f43e402cec84459a3d7f950bd5192
PKG_DESCR:=		graphical webbrowser
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libpthread alsa-lib dbus-glib glib libgtk libpng libtiff
PKG_DEPENDS+=		nspr nss libjpeg libatk pango cairo libxt libx11 libstdcxx hicolor-icon-theme
PKG_DEPENDS+=		libxdamage libxfixes libidl libsqlite libxcomposite gdk-pixbuf libintl
PKG_BUILDDEP:=		alsa-lib dbus-glib glib gtk+ libIDL libX11 MesaLib libtiff gdk-pixbuf
PKG_BUILDDEP+=		nspr nss jpeg libXt fontconfig sqlite atk libpng hicolor-icon-theme
PKG_URL:=		http://www.mozilla.org/
PKG_SITES:=		http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${PKG_VERSION}/source/
PKG_NOPARALLEL:=	1
PKG_NEED_CXX:=		1

PKG_ARCH_DEPENDS:=	x86 x86_64 native
PKG_HOST_DEPENDS:=	!netbsd !freebsd !openbsd !cygwin

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.source.tar.bz2
WRKDIST=		${WRKDIR}/mozilla-release

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FIREFOX,firefox,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# disable honour cflags stuff
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

CONFIGURE_ENV+=		CROSS_COMPILE=1 \
			HOST_CC="${CC_FOR_BUILD}" \
			HOST_CPPFLAGS="${CPPFLAGS_FOR_BUILD}" \
			HOST_CFLAGS="${CFLAGS_FOR_BUILD}" \
			HOST_LDFLAGS="${LDLAGS_FOR_BUILD}" \
			HOST_CXX="${CXX_FOR_BUILD}" \
			HOST_CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
			BUILD_LIBIDL_CONFIG="${BUILD_LIBIDL_CONFIG}" \
			PKG_HOSTLIB_DIR="${PKG_HOSTLIB_DIR}" \
			HOST_RANLIB="ranlib" HOST_AR="ar" \
			CPPFLAGS="-I${STAGING_TARGET_DIR}/usr/include/freetype2" \
			ac_cv_sqlite_secure_delete=yes \
			ac_cv_sqlite_threadsafe=yes \
			ac_cv_sqlite_enable_fts3=yes \
			ac_cv_sqlite_enable_unlock_notify=yes \
			ac_cv_thread_keyword=no \
			ac_cv_sizeof_int_p=4
CONFIGURE_ARGS+=	--enable-application=browser \
			--enable-official-branding \
			--with-system-zlib \
			--with-system-cairo \
			--with-system-pixman \
			--with-system-jpeg \
			--enable-system-sqlite \
			--with-libIDL-prefix=${STAGING_TARGET_DIR}/usr \
			--with-glib-prefix=${STAGING_TARGET_DIR}/usr \
			--enable-libxul \
			--disable-libnotify \
			--disable-accessibility \
			--disable-smil \
			--disable-dbus \
			--disable-debug \
			--disable-logging \
			--disable-strip \
			--disable-install-strip \
			--disable-tests \
			--disable-libconic \
			--disable-static \
			--disable-gnomeui \
			--disable-gnomevfs \
			--disable-optimize \
			--disable-necko-wifi \
			--disable-svg \
			--disable-mathml \
			--disable-jemalloc \
			--disable-crashreporter \
			--disable-libjpeg-turbo \
			--disable-elf-hack

XAKE_FLAGS+=		OS_RELEASE="2.6" HOST_CC=$(CC_FOR_BUILD) HOST_LDFLAGS=$(LDFLAGS_FOR_BUILD)
XAKE_FLAGS+=            ARCHFLAG="${TARGET_CFLAGS} ${TARGET_CPPFLAGS} ${TARGET_LDFLAGS}"

firefox-install:
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/bin
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/firefox-${PKG_VERSION} \
		$(IDIR_FIREFOX)/usr/lib
	$(CP) $(WRKINST)/usr/bin/firefox \
		$(IDIR_FIREFOX)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
