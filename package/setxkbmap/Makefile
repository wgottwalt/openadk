# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		setxkbmap
PKG_VERSION:=		1.3.1
PKG_RELEASE:=		1
PKG_HASH:=		e24a73669007fa3b280eba4bdc7f75715aeb2e394bf2d63f5cc872502ddde264
PKG_DESCR:=		set keyboard utility
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libxkbfile
PKG_SITES:=		http://www.x.org/releases/individual/app/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SETXKBMAP,setxkbmap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

setxkbmap-install:
	$(INSTALL_DIR) $(IDIR_SETXKBMAP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/setxkbmap \
		$(IDIR_SETXKBMAP)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
