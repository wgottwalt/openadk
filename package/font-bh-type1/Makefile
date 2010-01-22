# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		font-bh-type1
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		000da66f92370ac59e3df1b6719fdd9a
PKG_DESCR:=		X fonts
PKG_SECTION:=		x11
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONT_BH_TYPE1,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_FONT_BH_TYPE1)/usr/share/fonts/X11/Type1
	$(CP) ${WRKINST}/usr/share/fonts/X11/Type1/* \
		$(IDIR_FONT_BH_TYPE1)/usr/share/fonts/X11/Type1

include ${TOPDIR}/mk/pkg-bottom.mk
