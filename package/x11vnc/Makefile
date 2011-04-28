# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		x11vnc
PKG_VERSION:=		0.9.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		1498a68d02aa7b6c97bf746c073c8d00
PKG_DESCR:=		VNC server for X11 displays
PKG_SECTION:=		x11/apps
PKG_BUILDDEP:=		libX11 libXtst
PKG_URL:=		http://www.karlrunge.com/x11vnc/
PKG_SITES:=		http://openadk.org/distfiles/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,X11VNC,x11vnc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-ssl

x11vnc-install:
	$(INSTALL_DIR) $(IDIR_X11VNC)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/x11vnc \
		$(IDIR_X11VNC)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
