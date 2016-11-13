# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		evilwm
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_HASH:=		79589c296a5915ee0bae1d231e8912601fc794d9f0a9cacb6b648ff9a5f2602a
PKG_DESCR:=		minimalist window manager
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libx11 libxext libxrandr
PKG_BUILDDEP:=		libX11 libXext libXrandr
PKG_URL:=		http://www.6809.org.uk/evilwm/
PKG_SITES:=		http://www.6809.org.uk/evilwm/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EVILWM,evilwm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

MAKE_FLAGS+=		XROOT="$(STAGING_TARGET_DIR)/usr"

evilwm-install:
	$(INSTALL_DIR) $(IDIR_EVILWM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/evilwm $(IDIR_EVILWM)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
