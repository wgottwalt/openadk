# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xrandr
PKG_VERSION:=		1.5.0
PKG_RELEASE:=		1
PKG_HASH:=		ddfe8e7866149c24ccce8e6aaa0623218ae19130c2859cadcaa4228d8bb4a46d
PKG_DESCR:=		xrandr utility
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libx11 libxi libxinerama libxrandr
PKG_BUILDDEP:=		libX11 libXi libXinerama libXrandr xproto xextproto
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://www.x.org/releases/individual/app/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XRANDR,xrandr,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xrandr-install:
	$(INSTALL_DIR) $(IDIR_XRANDR)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xrandr \
		$(IDIR_XRANDR)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
