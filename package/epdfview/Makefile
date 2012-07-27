# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		epdfview
PKG_VERSION:=		0.1.8
PKG_RELEASE:=		2
PKG_MD5SUM:=		0c57d5e33adbfba047ffa13e570f79d6
PKG_DESCR:=		lightweight pdf viewer
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		poppler libgtk
PKG_BUILDDEP:=		poppler gtk+
PKG_URL:=		http://trac.emma-soft.com/epdfview/wiki
PKG_SITES:=		http://trac.emma-soft.com/epdfview/chrome/site/releases/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EPDFVIEW,epdfview,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

epdfview-install:
	$(INSTALL_DIR) $(IDIR_EPDFVIEW)/usr/share/epdfview
	$(CP) $(WRKINST)/usr/share/epdfview/* \
		$(IDIR_EPDFVIEW)/usr/share/epdfview
	$(INSTALL_DIR) $(IDIR_EPDFVIEW)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/epdfview \
		$(IDIR_EPDFVIEW)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
