# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXfixes
PKG_VERSION:=		4.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		556ffa2e75f2a3b5d92d004a6b124a6d
PKG_DESCR:=		X Fixes Library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		fixesproto xextproto xproto libX11
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXFIXES LIBXFIXES_DEV
PKGSC_LIBXFIXES_DEV:=	x11/devel
PKGSD_LIBXFIXES_DEV:=	X Fixes headers

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFIXES,libxfixes,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXFIXES_DEV,libxfixes-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXFIXES_DEV},${PKGSC_LIBXFIXES_DEV}))

libxfixes-install:
	$(INSTALL_DIR) $(IDIR_LIBXFIXES)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXfixes*.so* \
		$(IDIR_LIBXFIXES)/usr/lib

libxfixes-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBXFIXES_DEV)/usr/include/X11/extensions
	$(CP) $(WRKINST)/usr/include/X11/extensions/Xfixes.h \
		$(IDIR_LIBXFIXES_DEV)/usr/include/X11/extensions
	$(INSTALL_DIR) $(IDIR_LIBXFIXES_DEV)/usr/lib/pkgconfig
	$(CP) $(WRKINST)/usr/lib/pkgconfig/xfixes.pc \
		$(IDIR_LIBXFIXES_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
