# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pulseaudio
PKG_VERSION:=		4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		591f211db2790a7e4d222f2dc6858db3
PKG_DESCR:=		a sound system for POSIX OSes
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libltdl json-c libsndfile libudev libspeex
PKG_DEPENDS+=		libflac libvorbis libogg libuuid libsndfile
PKG_BUILDDEP:=		libtool json-c libsndfile eudev speex libsndfile
PKG_BUILDDEP+=		flac libvorbis libogg util-linux
PKG_URL:=		http://www.freedesktop.org/wiki/Software/PulseAudio/
PKG_SITES:=		http://freedesktop.org/software/pulseaudio/releases/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PULSEAUDIO,pulseaudio,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-systemd \
			--disable-manpages \
			--disable-neon-opt \
			--disable-x11 \
			--disable-openssl \
			--enable-dbus \
			--enable-udev \
			--enable-speex \

pulseaudio-install:
	$(INSTALL_DIR) $(IDIR_PULSEAUDIO)/etc/pulse
	$(CP) $(WRKINST)/etc/pulse/* \
		$(IDIR_PULSEAUDIO)/etc/pulse
	$(INSTALL_DIR) $(IDIR_PULSEAUDIO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* \
		$(IDIR_PULSEAUDIO)/usr/bin
	$(INSTALL_DIR) $(IDIR_PULSEAUDIO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpulse*.so* \
		$(IDIR_PULSEAUDIO)/usr/lib
	$(INSTALL_DIR) $(IDIR_PULSEAUDIO)/usr/lib/pulse-$(PKG_VERSION)/modules
	$(CP) $(WRKINST)/usr/lib/pulse-$(PKG_VERSION)/modules/*.so \
		$(IDIR_PULSEAUDIO)/usr/lib/pulse-$(PKG_VERSION)/modules

include ${TOPDIR}/mk/pkg-bottom.mk
