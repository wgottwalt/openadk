# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libva
PKG_VERSION:=		1.7.3
PKG_RELEASE:=		1
PKG_HASH:=		22bc139498065a7950d966dbdb000cad04905cbd3dc8f3541f80d36c4670b9d9
PKG_DESCR:=		video acceleration api library
PKG_SECTION:=		libs/video
PKG_BUILDDEP:=		libdrm
PKG_URL:=		https://www.freedesktop.org/wiki/Software/vaapi/
PKG_SITES:=		https://www.freedesktop.org/software/vaapi/releases/libva/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBVA,libva,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--disable-wayland \
			--disable-docs \
			--enable-glx \
			--enable-drm \
			--enable-x11 \
			--with-drivers-path=/usr/lib/va/drivers

libva-install:
	$(INSTALL_DIR) $(IDIR_LIBVA)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libva*.so* \
		$(IDIR_LIBVA)/usr/lib
	$(INSTALL_DIR) $(IDIR_LIBVA)/usr/bin
	$(CP) $(WRKINST)/usr/bin/* \
		$(IDIR_LIBVA)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
