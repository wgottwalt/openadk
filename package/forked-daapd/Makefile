# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		forked-daapd
PKG_VERSION:=		0.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		cc35619babefea35db9ee22e6f1d036b
PKG_DESCR:=		DAAPD server
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libunistring zlib libconfuse sqlite ffmpeg libgcrypt
PKG_DEPENDS+=		libavahi libmxml libevent libavl libantlr3c alsa-lib
PKG_DEPENDS+=		libsqlite libintl dbus
PKG_BUILDDEP:=		libunistring zlib confuse avahi sqlite ffmpeg dbus
PKG_BUILDDEP+=		mxml libevent libavl libantlr3c alsa-lib libgcrypt
PKG_SITES:=		http://alioth.debian.org/~jblache/forked-daapd/

PKG_CFLINE_FORKED_DAAPD:=	select ADK_KERNEL_INOTIFY_USER

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FORKED_DAAPD,forked-daapd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

forked-daapd-install:
	$(INSTALL_DIR) $(IDIR_FORKED_DAAPD)/etc
	$(CP) ./files/forked-daapd.conf \
		$(IDIR_FORKED_DAAPD)/etc
	$(INSTALL_DIR) $(IDIR_FORKED_DAAPD)/usr/lib/forked-daapd
	$(CP) $(WRKINST)/usr/lib/forked-daapd/*.so \
		$(IDIR_FORKED_DAAPD)/usr/lib/forked-daapd
	$(INSTALL_DIR) $(IDIR_FORKED_DAAPD)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/forked-daapd \
		$(IDIR_FORKED_DAAPD)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
