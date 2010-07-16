# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xset
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		65774f3d4e7f65a7fe07294a86b8e104
PKG_DESCR:=		X set utility
PKG_SECTION:=		x11/apps
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://www.x.org/releases/X11R7.5/src/app/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XSET,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_XSET)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xset \
		$(IDIR_XSET)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
