# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xsm
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		1
PKG_HASH:=		3f0134f1d763eb2f26819a122b9161942cf7860c4582931f6fa3943d3a4952f7
PKG_DESCR:=		session manager
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libxaw
PKG_BUILDDEP:=		libXaw
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
