# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXdamage
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		5e54789fd1c56392d38d29c6b8dad142
PKG_DESCR:=		X Window System client interface to the DAMAGE extension to the X protocol
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXfixes damageproto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXDAMAGE LIBXDAMAGE_DEV

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXDAMAGE,libxdamage,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXDAMAGE_DEV,libxdamage-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

libxdamage-install:
	$(INSTALL_DIR) $(IDIR_LIBXDAMAGE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXdamage*.so* \
		$(IDIR_LIBXDAMAGE)/usr/lib

libxdamage-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBXDAMAGE_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_LIBXDAMAGE_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_LIBXDAMAGE_DEV)/usr/lib/pkgconfig
	$(INSTALL_DATA) $(WRKINST)/usr/lib/pkgconfig/*.pc \
		$(IDIR_LIBXDAMAGE_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
