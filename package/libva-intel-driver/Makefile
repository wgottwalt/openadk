# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libva-intel-driver
PKG_VERSION:=		1.7.3
PKG_RELEASE:=		1
PKG_HASH:=		76ad37d9fd5ae23d8ce6052d50b5e6438a8df9e769b13fe34b771cd453f4f937
PKG_DESCR:=		video acceleration api driver for intel cards
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libdrm libva
PKG_BUILDDEP:=		libdrm libva
PKG_URL:=		https://www.freedesktop.org/wiki/Software/vaapi/
PKG_SITES:=		https://www.freedesktop.org/software/vaapi/releases/libva-intel-driver/
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	x86 x86_64

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBVA_INTEL_DRIVER,libva-intel-driver,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--disable-wayland \
			--disable-tests \
			--enable-drm \
			--enable-x11

libva-intel-driver-install:
	$(INSTALL_DIR) $(IDIR_LIBVA_INTEL_DRIVER)/usr/lib/va/drivers
	$(CP) $(WRKINST)//usr/lib/va/drivers/*.so \
		$(IDIR_LIBVA_INTEL_DRIVER)/usr/lib/va/drivers

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
