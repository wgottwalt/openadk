# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		setxkbmap
PKG_VERSION:=		1.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		24b2b316af406898f39be56205132bb2
PKG_DESCR:=		set keyboard utility
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libxkbfile
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/app/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SETXKBMAP,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_SETXKBMAP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/setxkbmap \
		$(IDIR_SETXKBMAP)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
