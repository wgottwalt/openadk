# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		hicolor-icon-theme
PKG_VERSION:=		0.12
PKG_RELEASE:=		1
PKG_HASH:=		9edca690617eaa19054951ca53501c802180262be8880ed84754ac46c93bec73
PKG_DESCR:=		hicolor icon theme
PKG_SECTION:=		x11/misc
PKG_URL:=		http://icon-theme.freedesktop.org/
PKG_SITES:=		http://icon-theme.freedesktop.org/releases/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HICOLOR_ICON_THEME,hicolor-icon-theme,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

hicolor-icon-theme-install:
	$(INSTALL_DIR) $(IDIR_HICOLOR_ICON_THEME)/usr/share/icons
	$(CP) $(WRKINST)/usr/share/icons/* \
		$(IDIR_HICOLOR_ICON_THEME)/usr/share/icons

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
