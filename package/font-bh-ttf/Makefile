# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		font-bh-ttf
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		baea1bb10808857e595f13c6be9cbfbe
PKG_DESCR:=		X fonts
PKG_SECTION:=		x11/fonts
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_HOST_DEPENDS:=      !netbsd !openbsd !cygwin !freebsd !mirbsd

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONT_BH_TTF,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_FONT_BH_TTF)/usr/share/fonts/X11/TTF
	$(CP) ${WRKINST}/usr/share/fonts/X11/TTF/* \
		$(IDIR_FONT_BH_TTF)/usr/share/fonts/X11/TTF

include ${TOPDIR}/mk/pkg-bottom.mk
