# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		firefox
PKG_VERSION:=		3.6.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		5e4541ab23084b7b14ba228291ce2688
PKG_DESCR:=		graphical webbrowser
PKG_SECTION:=		x11
PKG_DEPENDS:=		libpthread alsa-lib dbus-glib glib gtk+ libnotify libidl
PKG_DEPENDS+=		nspr nss libjpeg atk pango cairo libxt libx11 libstdcxx
PKG_DEPENDS+=		libxdamage libxfixes
PKG_BUILDDEP+=		alsa-lib dbus-glib glib gtk+ libnotify libIDL libX11 libXt
PKG_BUILDDEP+=		nspr nss jpeg
PKG_URL:=		http://www.mozilla.org/
PKG_SITES:=		http://releases.mozilla.org/pub/mozilla.org/firefox/releases/3.6.3/source/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.source.tar.bz2

WRKDIST=		${WRKDIR}/mozilla-1.9.2
PKG_TARGET_DEPENDS:=	alix1c x86_qemu x86_64_qemu shuttle ibmx40

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FIREFOX,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		CROSS_COMPILE=1 HOST_CC="${HOSTCC}" HOST_CFLAGS="${HOSTCFLAGS}" \
			HOST_CXX="${HOSTCXX}" HOST_CXXFLAGS="${HOSTCXXFLAGS}" \
			HOST_LIBIDL_CONFIG="/usr/bin/libIDL-config-2"
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
			--disable-crashreporter

post-install:
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/bin
	$(INSTALL_DIR) $(IDIR_FIREFOX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/firefox-3.6.3 \
		$(IDIR_FIREFOX)/usr/lib/
	$(CP) $(WRKINST)/usr/bin/firefox \
		$(IDIR_FIREFOX)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
