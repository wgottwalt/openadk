# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		forked-daapd
PKG_VERSION:=		0.19
PKG_RELEASE:=		1
PKG_HASH:=		0d15628599c7a316f6db33815b877a3d9a2ceaebad66c39dfb8bf6a2d1469cb9
PKG_DESCR:=		daapd server
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		libunistring zlib libconfuse sqlite libffmpeg libgcrypt
PKG_DEPENDS+=		libavahi libmxml libevent libavl libantlr3c alsa-lib
PKG_DEPENDS+=		libsqlite libintl dbus
PKG_BUILDDEP:=		libunistring zlib confuse avahi sqlite ffmpeg dbus
PKG_BUILDDEP+=		mxml libevent libavl libantlr3c alsa-lib libgcrypt
PKG_SITES:=		http://www.openadk.org/distfiles/

PKG_CFLINE_FORKED_DAAPD:=	select ADK_KERNEL_INOTIFY_USER
PKG_ARCH_DEPENDS:=	!ppc
# gperf problem
PKG_HOST_DEPENDS:=	!freebsd

include $(ADK_TOPDIR)/mk/package.mk

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
