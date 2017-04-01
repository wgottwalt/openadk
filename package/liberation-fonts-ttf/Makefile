# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		liberation-fonts-ttf
PKG_VERSION:=		2.00.1
PKG_RELEASE:=		1
PKG_HASH:=		7890278a6cd17873c57d9cd785c2d230d9abdea837e96516019c5885dd271504
PKG_DESCR:=		free fonts compatible to msttfonts
PKG_SECTION:=		x11/fonts
PKG_URL:=		https://fedorahosted.org/liberation-fonts/
PKG_SITES:=		https://releases.pagure.org/liberation-fonts/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBERATION_FONTS_TTF,liberation-fonts-ttf,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

liberation-fonts-ttf-install:
	$(INSTALL_DIR) $(IDIR_LIBERATION_FONTS_TTF)/usr/share/fonts/truetype/liberation
	$(CP) $(WRKSRC)/*.ttf $(IDIR_LIBERATION_FONTS_TTF)/usr/share/fonts/truetype/liberation

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
