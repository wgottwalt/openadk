# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXi
PKG_VERSION:=		1.4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		b9dfc98b27e3770567e4c6a3365a21b7
PKG_DESCR:=		X Window System client interface to the XINPUT extension to the X protocol.
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto xextproto libXext
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXI LIBXI_DEV
PKGSS_LIBXI_DEV:=	inputproto
PKGSC_LIBXI_DEV:=	x11/devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXI,libxi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},$(PKG_OPTS)))
$(eval $(call PKG_template,LIBXI_DEV,libxi-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_LIBXI_DEV},${PKG_DESCR},${PKGSC_LIBXI_DEV},$(PKG_OPTS)))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

post-install:
	$(INSTALL_DIR) $(IDIR_LIBXI)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXi*.so* \
		$(IDIR_LIBXI)/usr/lib

libxi-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBXI_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_LIBXI_DEV)/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
