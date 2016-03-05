# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		dialog
PKG_VERSION:=		1.3-20160126
PKG_RELEASE:=		1
PKG_HASH:=		308ab0bc63eb525c852c85ad4aa8645c84277ea2f7fca19ef4cafafc08415ae3
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
# Should detect this automatically but while doing so it tries to add /lib64 which breaks build so specify this explicitely
CONFIGURE_ARGS+=	--with-ncurses

dialog-install:
	$(INSTALL_DIR) $(IDIR_DIALOG)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/dialog $(IDIR_DIALOG)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
