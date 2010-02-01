# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		font-misc-misc
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		047eae4d061f17d96213c4e78f7abccb
PKG_DESCR:=		X fonts
PKG_SECTION:=		x11
PKG_BUILDDEP+=		font-util
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONT_MISC_MISC,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_FONT_MISC_MISC)/usr/share/fonts/X11/misc
	$(CP) ${WRKINST}/usr/share/fonts/X11/misc/* \
		$(IDIR_FONT_MISC_MISC)/usr/share/fonts/X11/misc

include ${TOPDIR}/mk/pkg-bottom.mk
