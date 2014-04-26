# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		font-bitstream-100dpi
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		c27bf37e9b8039f93bd90b8131ed37ad
PKG_DESCR:=		X fonts
PKG_SECTION:=		x11/fonts
PKG_BUILDDEP:=		font-util
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_HOST_DEPENDS:=      !netbsd !openbsd !cygwin !freebsd !mirbsd

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONT_BITSTREAM_100DPI,font-bitstream-100dpi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

font-bitstream-100dpi-install:
	$(INSTALL_DIR) $(IDIR_FONT_BITSTREAM_100DPI)/usr/share/fonts/X11/100dpi
	$(CP) ${WRKINST}/usr/share/fonts/X11/100dpi/* \
		$(IDIR_FONT_BITSTREAM_100DPI)/usr/share/fonts/X11/100dpi

include ${TOPDIR}/mk/pkg-bottom.mk
