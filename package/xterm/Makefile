# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xterm
PKG_VERSION:=		267
PKG_RELEASE:=		1
PKG_MD5SUM:=		3945ab70cfa2a9e95804157ee1b0f8e8
PKG_DESCR:=		Terminal Emulator for X Windows
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libxaw libxt
PKG_BUILDDEP:=		libXt libXmu libXaw
PKG_URL:=		http://invisible-island.net/xterm/xterm.html
PKG_SITES:=		ftp://invisible-island.net/xterm/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tgz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XTERM,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_XTERM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{koi8rxterm,resize,uxterm,xterm} \
		$(IDIR_XTERM)/usr/bin/
	$(INSTALL_DIR) $(IDIR_XTERM)/usr/lib/X11/app-defaults
	$(INSTALL_DATA) ${WRKINST}/usr/lib/X11/app-defaults/{KOI8RXTerm,KOI8RXTerm-color,UXTerm,UXTerm-color,XTerm,XTerm-color} \
		${IDIR_XTERM}/usr/lib/X11/app-defaults/

include ${TOPDIR}/mk/pkg-bottom.mk
