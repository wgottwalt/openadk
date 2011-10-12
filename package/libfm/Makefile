# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libfm
PKG_VERSION:=		0.1.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		c09bce415ff6dc2dd835e28aeddeabe3
PKG_DESCR:=		libfm library
PKG_SECTION:=		x11/lxde
PKG_BUILDDEP:=		menu-cache libXcursor
PKG_DEPENDS:=		menu-cache libxcursor
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/libfm%20%28required%20by%20PCManFM%29/

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
