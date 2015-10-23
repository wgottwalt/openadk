# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		feh
PKG_VERSION:=		2.14
PKG_RELEASE:=		1
PKG_HASH:=		3829cd8995ec7cc08095a2b22a6c98d1e2638bd87c8b4f0e85a059c6f0edbc48
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
