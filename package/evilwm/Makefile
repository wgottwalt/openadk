# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		evilwm
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		8fd9256c635cce2289b648a01d54202c
PKG_DESCR:=		A minimalist window manager for the X Window System
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libx11 libxext
PKG_BUILDDEP+=		libX11 libXext
PKG_URL:=		http://www.6809.org.uk/evilwm/
PKG_SITES:=		http://www.6809.org.uk/evilwm/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EVILWM,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

MAKE_FLAGS+=		XROOT="$(STAGING_DIR)/usr"

post-install:
	$(INSTALL_DIR) $(IDIR_EVILWM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/evilwm $(IDIR_EVILWM)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
