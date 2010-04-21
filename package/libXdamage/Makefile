# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXdamage
PKG_VERSION:=		1.1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		f8f19f747c8445213d5409ae8b8b2f0a
PKG_DESCR:=		add short description
PKG_SECTION:=		libs
PKG_BUILDDEP+=		libXfixes
PKG_URL:=		add project url
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/lib/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXDAMAGE,libxdamage,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBXDAMAGE)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/lib/libXdamage* \
		$(IDIR_LIBXDAMAGE)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
