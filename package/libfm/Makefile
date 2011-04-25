# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libfm
PKG_VERSION:=		2.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		188d0820aa4e8f25f3fb0519813baa68
PKG_DESCR:=		libfm library
PKG_SECTION:=		x11/lxde
PKG_BUILDDEP:=		menu-cache libXcursor
PKG_DEPENDS:=		menu-cache libxcursor
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SUBPKGS:=		LIBFM LIBFM_DEV

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFM,libfm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBFM_DEV,libfm-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CPPFLAGS_FOR_BUILD+=	$(shell pkg-config --cflags glib-2.0)
LDFLAGS_FOR_BUILD+=	$(shell pkg-config --libs glib-2.0) -L/usr/lib
CONFIGURE_ARGS+=	--disable-gtk-doc

libfm-install:
	$(INSTALL_DIR) $(IDIR_LIBFM)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libfm*.so* \
		$(IDIR_LIBFM)/usr/lib

libfm-install-dev:
	$(INSTALL_DIR) $(IDIR_LIBFM_DEV)/usr/lib/pkgconfig
	$(CP) $(WRKINST)/usr/lib/pkgconfig/*.pc \
		$(IDIR_LIBFM_DEV)/usr/lib/pkgconfig
	$(INSTALL_DIR) $(IDIR_LIBFM_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_LIBFM_DEV)/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
