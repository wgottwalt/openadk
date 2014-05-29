# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xsm
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		6dfc70ae1c13f775f1c646a6d8780076
PKG_DESCR:=		session manager
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libxaw
PKG_BUILDDEP:=		libXaw
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XSM,xsm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xsm-install:
	$(INSTALL_DIR) $(IDIR_XSM)/usr/lib/X11
	$(CP) $(WRKINST)/usr/lib/X11/* \
		$(IDIR_XSM)/usr/lib/X11
	$(INSTALL_DIR) $(IDIR_XSM)/usr/share/X11
	$(CP) $(WRKINST)/usr/share/X11/* \
		$(IDIR_XSM)/usr/lib/X11
	$(INSTALL_DIR) $(IDIR_XSM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xsm \
		$(IDIR_XSM)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
