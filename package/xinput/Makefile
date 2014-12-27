# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xinput
PKG_VERSION:=		1.6.0
PKG_RELEASE:=		1
PKG_HASH:=		a3117a323cc32c80428dd1604df8d0f87ecbfb03a4975c187475a04f7201dfb7
PKG_DESCR:=		input utility
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libxi libxinerama libxrandr
PKG_BUILDDEP:=		libXi libXinerama libXrandr
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XINPUT,xinput,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xinput-install:
	$(INSTALL_DIR) $(IDIR_XINPUT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xinput \
		$(IDIR_XINPUT)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
