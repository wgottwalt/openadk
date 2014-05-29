# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		feh
PKG_VERSION:=		2.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		6714dedeff1db5c3593c4a27b0d9cf50
PKG_DESCR:=		image viewer
PKG_SECTION:=		mm/image
PKG_BUILDDEP:=		imlib2 giblib libXt
PKG_DEPENDS:=		imlib2 giblib
PKG_SITES:=		http://feh.finalrewind.org/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FEH,feh,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		PREFIX=/usr
CONFIG_STYLE:=		manual
MAKE_FLAGS+=		curl=0 xinerama=0

feh-install:
	$(INSTALL_DIR) $(IDIR_FEH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/feh $(IDIR_FEH)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
