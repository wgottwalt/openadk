# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xdotool
PKG_VERSION:=		2.20110530.1
PKG_RELEASE:=		1
PKG_HASH:=		e7b42c8b1d391970e1c1009b256033f30e57d8e0a2a3de229fd61ecfc27baf67
PKG_DESCR:=		tool lets you simulate keyboard input and mouse activity, move and resize windows
PKG_SECTION:=		x11/misc
PKG_DEPENDS:=		libxtst libxinerama libxi
PKG_BUILDDEP:=		libXtst libXinerama libXi
PKG_URL:=		http://www.semicomplete.com/projects/xdotool/
PKG_SITES:=		http://semicomplete.googlecode.com/files/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XDOTOOL,xdotool,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		PREFIX=/usr

xdotool-install:
	$(INSTALL_DIR) $(IDIR_XDOTOOL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libxdo.so* \
		$(IDIR_XDOTOOL)/usr/lib
	$(INSTALL_DIR) $(IDIR_XDOTOOL)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xdotool \
		$(IDIR_XDOTOOL)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
