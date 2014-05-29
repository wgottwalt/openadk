# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		forked-daapd
PKG_VERSION:=		0.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		53e6f1d6683e3275e7c7698ec923a97e
PKG_DESCR:=		daapd server
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		libunistring zlib libconfuse sqlite libffmpeg libgcrypt
PKG_DEPENDS+=		libavahi libmxml libevent libavl libantlr3c alsa-lib
PKG_DEPENDS+=		libsqlite libintl dbus
PKG_BUILDDEP:=		libunistring zlib confuse avahi sqlite ffmpeg dbus
PKG_BUILDDEP+=		mxml libevent libavl libantlr3c alsa-lib libgcrypt
PKG_SITES:=		http://alioth.debian.org/~jblache/forked-daapd/

PKG_CFLINE_FORKED_DAAPD:=	select ADK_KERNEL_INOTIFY_USER@
PKG_CFLINE_FORKED_DAAPD+=	depends on ADK_BROKEN@
PKG_ARCH_DEPENDS:=	!ppc
# gperf problem
PKG_HOST_DEPENDS:=	!freebsd

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FORKED_DAAPD,forked-daapd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-levent

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
