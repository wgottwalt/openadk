# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		tigervnc
PKG_VERSION:=		1.7.0
PKG_RELEASE:=		1
PKG_HASH:=		4aa704747b4f8f1d59768b663c488fa937e6783db2a46ae407cd2a599cfbf8b1
PKG_DESCR:=		x11 vnc server
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libfltk libjpeg-turbo libsm libice libxtst libx11 zlib
PKG_DEPENDS+=		libxext libxdamage
PKG_BUILDDEP:=		fltk libjpeg-turbo libSM libICE libXtst libX11 zlib
PKG_BUILDDEP+=		libXext libXdamage cmake-host
PKG_NEEDS:=		c++
PKG_URL:=		http://tigervnc.org
PKG_SITES:=		https://github.com/TigerVNC/tigervnc/archive/

DISTFILES:=             v$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TIGERVNC,tigervnc,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		cmake

tigervnc-install:
	$(INSTALL_DIR) $(IDIR_TIGERVNC)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* \
		$(IDIR_TIGERVNC)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
