# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xinput
PKG_VERSION:=		1.6.2
PKG_RELEASE:=		1
PKG_HASH:=		2c8ca5ff2a8703cb7d898629a4311db720dbd30d0c162bfe37f18849a727bd42
PKG_DESCR:=		input utility
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libxi libxinerama libxrandr
PKG_BUILDDEP:=		libXi libXinerama libXrandr
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://www.x.org/releases/individual/app/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XINPUT,xinput,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xinput-install:
	$(INSTALL_DIR) $(IDIR_XINPUT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xinput \
		$(IDIR_XINPUT)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
