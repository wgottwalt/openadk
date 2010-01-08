# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		dialog
PKG_VERSION:=		1.1-20080819
PKG_RELEASE:=		1
PKG_MD5SUM:=		3caebd641a9f337b980becb4444336c5
PKG_DESCR:=		A text gui interface
PKG_SECTION:=		misc
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP+=		ncurses
PKG_SITES:=		ftp://ftp.us.debian.org/debian/pool/main/d/dialog/

DISTFILES:=             ${PKG_NAME}_${PKG_VERSION}.orig.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DIALOG,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_FILE:=		makefile
CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_DIALOG)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/dialog $(IDIR_DIALOG)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
