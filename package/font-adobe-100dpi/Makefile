# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		font-adobe-100dpi
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		ba61e7953f4f5cec5a8e69c262bbc7f9
PKG_DESCR:=		X fonts
PKG_SECTION:=		x11/fonts
PKG_DEPENDS:=		font-util
PKG_BUILDDEP:=		font-util
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_HOST_DEPENDS:=      !netbsd !openbsd !cygwin !freebsd !mirbsd

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONT_ADOBE_100DPI,font-adobe-100dpi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

font-adobe-100dpi-install:
	$(INSTALL_DIR) $(IDIR_FONT_ADOBE_100DPI)/usr/share/fonts/X11/100dpi
	$(CP) ${WRKINST}/usr/share/fonts/X11/100dpi/* \
		$(IDIR_FONT_ADOBE_100DPI)/usr/share/fonts/X11/100dpi

include ${TOPDIR}/mk/pkg-bottom.mk
