# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		font-bitstream-75dpi
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		f8e982bcaaed199fdac03e9fc12b2952
PKG_DESCR:=		X fonts
PKG_SECTION:=		x11
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONT_BITSTREAM_75DPI,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_FONT_BITSTREAM_75DPI)/usr/share/fonts/X11/75dpi
	$(CP) ${WRKINST}/usr/share/fonts/X11/75dpi/* \
		$(IDIR_FONT_BITSTREAM_75DPI)/usr/share/fonts/X11/75dpi

include ${TOPDIR}/mk/pkg-bottom.mk
