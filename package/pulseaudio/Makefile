# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pulseaudio
PKG_VERSION:=		4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		591f211db2790a7e4d222f2dc6858db3
PKG_DESCR:=		sound system for POSIX OSes
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libltdl json-c libsndfile libspeex libncurses
PKG_DEPENDS+=		libflac libvorbis libogg libuuid libsndfile
PKG_DEPENDS+=		libpthread librt alsa-lib libsamplerate
PKG_BUILDDEP:=		libtool json-c libsndfile speex libsamplerate
PKG_BUILDDEP+=		flac libvorbis libogg util-linux ncurses alsa-lib
PKG_URL:=		http://www.freedesktop.org/wiki/Software/PulseAudio/
PKG_SITES:=		http://freedesktop.org/software/pulseaudio/releases/
PKG_OPTS:=		dev

PKG_LIBC_DEPENDS:=	uclibc glibc

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PULSEAUDIO,pulseaudio,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE -D_POSIX_SOURCE
CONFIGURE_ARGS+=	--disable-systemd \
			--disable-manpages \
			--disable-neon-opt \
			--disable-x11 \
			--disable-avahi \
			--disable-lirc \
			--disable-openssl \
			--disable-orc \
			--disable-tcpwrap \
			--disable-oss-output \
			--disable-oss-wrapper \
			--disable-esound \
			--disable-jack \
			--disable-gconf \
			--disable-udev \
			--disable-dbus \
			--disable-hal-compat \
			--enable-samplerate \
			--enable-alsa \
			--with-speex \
			--with-access-group=audio

pulseaudio-install:
	$(INSTALL_DIR) $(IDIR_PULSEAUDIO)/etc/pulse
	$(CP) ./files/*.{conf,pa} \
		$(IDIR_PULSEAUDIO)/etc/pulse
	$(INSTALL_DIR) $(IDIR_PULSEAUDIO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* \
		$(IDIR_PULSEAUDIO)/usr/bin
	$(INSTALL_DIR) $(IDIR_PULSEAUDIO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpulse*.so* \
		$(IDIR_PULSEAUDIO)/usr/lib
	$(INSTALL_DIR) $(IDIR_PULSEAUDIO)/usr/lib/pulseaudio
	$(CP) $(WRKINST)/usr/lib/pulseaudio/libpulse*.so* \
		$(IDIR_PULSEAUDIO)/usr/lib/pulseaudio
	$(INSTALL_DIR) $(IDIR_PULSEAUDIO)/usr/lib/pulse-$(PKG_VERSION)/modules
	$(CP) $(WRKINST)/usr/lib/pulse-$(PKG_VERSION)/modules/*.so \
		$(IDIR_PULSEAUDIO)/usr/lib/pulse-$(PKG_VERSION)/modules
	# pa uses $HOME from root user otherwise
	mv $(IDIR_PULSEAUDIO)/usr/bin/pacmd $(IDIR_PULSEAUDIO)/usr/bin/pacmd.bin
	echo "#!/bin/sh" > $(IDIR_PULSEAUDIO)/usr/bin/pacmd
	echo 'PULSE_RUNTIME_PATH=/var/run/pulse pacmd.bin "$$@"' >> $(IDIR_PULSEAUDIO)/usr/bin/pacmd
	chmod 755 $(IDIR_PULSEAUDIO)/usr/bin/pacmd

include ${TOPDIR}/mk/pkg-bottom.mk
