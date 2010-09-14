# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		firefox
PKG_VERSION:=		3.6.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		0ee5f14fd8be07513d16131027ebcb61
PKG_DESCR:=		graphical webbrowser
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libpthread alsa-lib dbus-glib glib libgtk+ libnotify
PKG_DEPENDS+=		nspr nss libjpeg atk pango cairo libxt libx11 libstdcxx
PKG_DEPENDS+=		libxdamage libxfixes libidl
PKG_BUILDDEP:=		alsa-lib dbus-glib glib gtk+ libnotify libIDL libX11
PKG_BUILDDEP+=		nspr nss jpeg libXt
PKG_URL:=		http://www.mozilla.org/
PKG_SITES:=		http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${PKG_VERSION}/source/

PKG_TARGET_DEPENDS:=	alix1c x86_qemu x86_64_qemu shuttle ibmx40 lemote
PKG_HOST_DEPENDS:=	!netbsd !freebsd !openbsd !cygwin

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.source.tar.bz2
WRKDIST=		${WRKDIR}/mozilla-1.9.2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FIREFOX,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_LINUX_MIPS64_LEMOTE},y)
CONFIGURE_ARGS+=	--disable-ipc
else ifeq (${ADK_TARGET_LIB_UCLIBC},y)
CONFIGURE_ARGS+=	--disable-ipc
else
CONFIGURE_ARGS+=	--enable-ipc
endif

CONFIGURE_ENV+=		CROSS_COMPILE=1 HOST_CC="${HOSTCC}" HOST_CFLAGS="${HOSTCFLAGS}" \
			HOST_CXX="${HOSTCXX}" HOST_CXXFLAGS="${HOSTCXXFLAGS}" \
			HOST_LIBIDL_CONFIG="/usr/bin/libIDL-config-2" \
			ac_cv_thread_keyword=no
CONFIGURE_ARGS+=	--enable-application=browser \
			--with-system-zlib \
			--with-system-jpeg \
			--with-system-png \
			--with-system-nss \
			--with-system-nspr \
			--with-libIDL-prefix=${STAGING_DIR}/usr \
			--with-glib-prefix=${STAGING_DIR}/usr \
			--enable-libxul \
			--disable-tests \
			--disable-static \
			--disable-gnomeui \
			--disable-gnomevfs \
			--disable-optimize \
			--disable-necko-wifi \
			--disable-svg \
			--disable-mathml \
			--disable-crashreporter

post-install:
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/bin
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/firefox-${PKG_VERSION} \
		$(IDIR_FIREFOX)/usr/lib/
	$(CP) $(WRKINST)/usr/bin/firefox \
		$(IDIR_FIREFOX)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
