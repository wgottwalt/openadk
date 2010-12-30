# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		firefox
PKG_VERSION:=		3.6.13
PKG_RELEASE:=		1
PKG_MD5SUM:=		d7c90aed8209beefa74badf02e8eeae1
PKG_DESCR:=		graphical webbrowser
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libpthread alsa-lib dbus-glib glib libgtk libnotify
PKG_DEPENDS+=		nspr nss libjpeg atk pango cairo libxt libx11 libstdcxx
PKG_DEPENDS+=		libxdamage libxfixes libidl libsqlite
PKG_BUILDDEP:=		alsa-lib dbus-glib glib gtk+ libnotify libIDL libX11
PKG_BUILDDEP+=		nspr nss jpeg libXt fontconfig sqlite
PKG_URL:=		http://www.mozilla.org/
PKG_SITES:=		http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${PKG_VERSION}/source/

PKG_ARCH_DEPENDS:=	x86 x86_64 mips mipsel mips64 mips64el
PKG_HOST_DEPENDS:=	!netbsd !freebsd !openbsd !cygwin

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.source.tar.bz2
WRKDIST=		${WRKDIR}/mozilla-1.9.2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FIREFOX,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_LINUX_MIPS64EL},y)
CONFIGURE_ARGS+=	--disable-ipc
else ifeq (${ADK_TARGET_LIB_UCLIBC},y)
CONFIGURE_ARGS+=	--disable-ipc
else
CONFIGURE_ARGS+=	--enable-ipc
endif

CONFIGURE_ENV+=		CROSS_COMPILE=1 HOST_CC="${HOSTCC}" HOST_CFLAGS="${HOSTCFLAGS}" \
			HOST_CXX="${HOSTCXX}" HOST_CXXFLAGS="${HOSTCXXFLAGS}" \
			HOST_LIBIDL_CONFIG="${HOST_LIBIDL_CONFIG}" \
			PKG_HOSTLIB_DIR="${PKG_HOSTLIB_DIR}" \
			HOST_RANLIB="ranlib" HOST_AR="ar" \
			CPPFLAGS="-I${STAGING_TARGET_DIR}/usr/include/freetype2" \
			ac_cv_sqlite_secure_delete=yes \
			ac_cv_thread_keyword=no \
			ac_cv_sizeof_int_p=4
CONFIGURE_ARGS+=	--enable-application=browser \
			--enable-official-branding \
			--with-system-zlib \
			--with-system-jpeg \
			--with-system-png \
			--with-system-nss \
			--with-system-nspr \
			--enable-system-sqlite \
			--with-libIDL-prefix=${STAGING_TARGET_DIR}/usr \
			--with-glib-prefix=${STAGING_TARGET_DIR}/usr \
			--enable-libxul \
			--disable-tests \
			--disable-libconic \
			--disable-static \
			--disable-gnomeui \
			--disable-gnomevfs \
			--disable-optimize \
			--disable-necko-wifi \
			--disable-svg \
			--disable-mathml \
			--disable-crashreporter

XAKE_FLAGS+=		OS_RELEASE="2.6"

post-install:
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/bin
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/firefox-${PKG_VERSION} \
		$(IDIR_FIREFOX)/usr/lib/
	$(CP) $(WRKINST)/usr/bin/firefox \
		$(IDIR_FIREFOX)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
