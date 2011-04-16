# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lxtask
PKG_VERSION:=		0.1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		5e54e91b09864c917e91ccafff61de9c
PKG_DESCR:=		graphical task manager
PKG_SECTION:=		x11/lxde
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://openadk.org/distfiles/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LXTASK,lxtask,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lxtask-install:
	$(INSTALL_DIR) $(IDIR_LXTASK)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lxtask \
		$(IDIR_LXTASK)/usr/bin
	$(INSTALL_DIR) $(IDIR_LXTASK)/usr/share/applications
	$(CP) $(WRKINST)/usr/share/applications/* \
		$(IDIR_LXTASK)/usr/share/applications

include ${TOPDIR}/mk/pkg-bottom.mk
