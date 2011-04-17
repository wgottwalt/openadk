# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lxde-common
PKG_VERSION:=		0.5.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		aac2f6f2efa53a6ac92e47e7f2a0c602
PKG_DESCR:=		LXDE de-common manager
PKG_SECTION:=		x11/lxde
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://openadk.org/distfiles/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LXDE_COMMON,lxde-common,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lxde-common-install:
	$(INSTALL_DIR) $(IDIR_LXDE_COMMON)/etc/xdg
	$(CP) $(WRKINST)/etc/xdg/* $(IDIR_LXDE_COMMON)/etc/xdg
	$(INSTALL_DIR) $(IDIR_LXDE_COMMON)/usr/bin
	$(CP) $(WRKINST)/usr/bin/* \
		$(IDIR_LXDE_COMMON)/usr/bin
	$(INSTALL_DIR) $(IDIR_LXDE_COMMON)/usr/share/lxde
	$(CP) $(WRKINST)/usr/share/lxde/* \
		$(IDIR_LXDE_COMMON)/usr/share/lxde
	$(INSTALL_DIR) $(IDIR_LXDE_COMMON)/usr/share/xsessions
	$(CP) $(WRKINST)/usr/share/xsessions/* \
		$(IDIR_LXDE_COMMON)/usr/share/xsessions

include ${TOPDIR}/mk/pkg-bottom.mk
