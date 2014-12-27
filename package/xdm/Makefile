# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xdm
PKG_VERSION:=		1.1.11
PKG_RELEASE:=		1
PKG_HASH:=		38c544a986143b1f24566c1a0111486b339b92224b927be78714eeeedca12a14
PKG_DESCR:=		display manager
PKG_SECTION:=		x11/apps
PKG_BUILDDEP:=		pam
PKG_DEPENDS:=		xconsole pam xsm
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XDM,xdm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-random-device=/dev/urandom \
			--with-utmp-file=/dev/null \
			--with-wtmp-file=/dev/null

xdm-install:
	$(INSTALL_DIR) $(IDIR_XDM)/usr/lib/X11
	$(CP) $(WRKINST)/usr/lib/X11/* \
		$(IDIR_XDM)/usr/lib/X11
	$(INSTALL_DIR) $(IDIR_XDM)/usr/share/X11
	$(CP) $(WRKINST)/usr/share/X11/* \
		$(IDIR_XDM)/usr/lib/X11
	$(INSTALL_DIR) $(IDIR_XDM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xdm \
		$(IDIR_XDM)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
