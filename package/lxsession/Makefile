# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lxsession
PKG_VERSION:=		0.4.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		d5cd0cb733748191b2c7371c9efda155
PKG_DESCR:=		LXDE session manager
PKG_SECTION:=		x11/lxde
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://sourceforge.net/projects/lxde/files/LXSession%20%28session%20manager%29/LXSession%200.4.5/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LXSESSION,lxsession,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

lxsession-install:
	$(INSTALL_DIR) $(IDIR_LXSESSION)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lxsession* \
		$(IDIR_LXSESSION)/usr/bin
	$(INSTALL_DIR) $(IDIR_LXSESSION)/usr/share/lxsession/images
	$(CP) $(WRKINST)/usr/share/lxsession/images/* \
		$(IDIR_LXSESSION)/usr/share/lxsession/images

include ${TOPDIR}/mk/pkg-bottom.mk
