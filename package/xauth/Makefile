# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xauth
PKG_VERSION:=		1.0.9
PKG_RELEASE:=		1
PKG_HASH:=		0709070caf23ba2fb99536907b75be1fe31853999c62d3e87a6a8d26ba8a8cdb
PKG_DESCR:=		authority file utility
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libx11 libxext libxmu
PKG_BUILDDEP:=		libX11 libXext libXmu
PKG_URL:=		http://www.x.org
PKG_SITES:=		http://www.x.org/releases/individual/app/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XAUTH,xauth,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xauth-install:
	$(INSTALL_DIR) $(IDIR_XAUTH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xauth $(IDIR_XAUTH)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
