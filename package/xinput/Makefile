# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xinput
PKG_VERSION:=		1.5.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		87ad4db2fad4ff9a68e57759a63abc4b
PKG_DESCR:=		X input utility
PKG_SECTION:=		x11/apps
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XINPUT,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_XINPUT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xinput \
		$(IDIR_XINPUT)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
