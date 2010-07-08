# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		firefox
PKG_VERSION:=		3.6.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		c9a071b31bb90d05edfb93117d0a7537
PKG_DESCR:=		graphical webbrowser
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libpthread alsa-lib dbus-glib glib libgtk+ libnotify libidl
PKG_DEPENDS+=		nspr nss libjpeg atk pango cairo libxt libx11 libstdcxx
PKG_DEPENDS+=		libxdamage libxfixes
PKG_BUILDDEP+=		alsa-lib dbus-glib glib gtk+ libnotify libIDL libX11 libXt
PKG_BUILDDEP+=		nspr nss jpeg
PKG_URL:=		http://www.mozilla.org/
PKG_SITES:=		http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${PKG_VERSION}/source/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.source.tar.bz2

WRKDIST=		${WRKDIR}/mozilla-1.9.2
PKG_TARGET_DEPENDS:=	alix1c x86_qemu x86_64_qemu shuttle ibmx40 lemote

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FIREFOX,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		CROSS_COMPILE=1 HOST_CC="${HOSTCC}" HOST_CFLAGS="${HOSTCFLAGS}" \
			HOST_CXX="${HOSTCXX}" HOST_CXXFLAGS="${HOSTCXXFLAGS}" \
			HOST_LIBIDL_CONFIG="/usr/bin/libIDL-config-2" \
			ac_cv_thread_keyword=no
CONFIGURE_ARGS+=	--enable-application=browser \
			--with-system-zlib \
			--with-system-jpeg \
			--with-system-nss \
			--with-system-nspr \
			--disable-tests \
			--disable-static \
			--enable-libxul \
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
