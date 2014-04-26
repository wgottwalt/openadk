# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		dialog
PKG_VERSION:=		1.2-20130928
PKG_RELEASE:=		1
PKG_MD5SUM:=		2cf55cd9d4603ffdb4b24cd6843d740c
PKG_DESCR:=		text gui interface
PKG_SECTION:=		misc
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_SITES:=		ftp://ftp.us.debian.org/debian/pool/main/d/dialog/

DISTFILES:=             ${PKG_NAME}_${PKG_VERSION}.orig.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DIALOG,dialog,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_FILE:=		makefile

dialog-install:
	$(INSTALL_DIR) $(IDIR_DIALOG)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/dialog $(IDIR_DIALOG)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
