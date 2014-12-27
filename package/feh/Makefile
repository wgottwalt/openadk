# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		feh
PKG_VERSION:=		2.10
PKG_RELEASE:=		1
PKG_HASH:=		bc782a884eedd7a73284804d8145238f140fa59fed8d483102d1d25e8144ca83
PKG_DESCR:=		image viewer
PKG_SECTION:=		mm/image
PKG_BUILDDEP:=		imlib2 giblib libXt
PKG_DEPENDS:=		imlib2 giblib
PKG_SITES:=		http://feh.finalrewind.org/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FEH,feh,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		PREFIX=/usr
CONFIG_STYLE:=		manual
MAKE_FLAGS+=		curl=0 xinerama=0

feh-install:
	$(INSTALL_DIR) $(IDIR_FEH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/feh $(IDIR_FEH)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
