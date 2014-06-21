# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		dialog
PKG_VERSION:=		1.2-20140219
PKG_RELEASE:=		1
PKG_MD5SUM:=		4ed9b2f1162eb7706857338d11e70f8e
PKG_DESCR:=		text gui interface
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://invisible-island.net/dialog/dialog.html
PKG_SITES:=		ftp://invisible-island.net/dialog/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DIALOG,dialog,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_FILE:=		makefile

dialog-install:
	$(INSTALL_DIR) $(IDIR_DIALOG)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/dialog $(IDIR_DIALOG)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
