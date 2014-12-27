# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		dialog
PKG_VERSION:=		1.2-20140219
PKG_RELEASE:=		1
PKG_HASH:=		ccf07eedf147ac901aff1d984ab63ddd6986b615ddf67435f270d5462ea4ca81
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
