# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xdpyinfo
PKG_VERSION:=		1.3.2
PKG_RELEASE:=		1
PKG_HASH:=		ef39935e8e9b328e54a85d6218d410d6939482da6058db1ee1b39749d98cbcf2
PKG_DESCR:=		display info utility
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libxtst
PKG_BUILDDEP:=		libXtst
PKG_URL:=		http://www.x.org/
PKG_SITES:=		http://www.x.org/releases/individual/app/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XDPYINFO,xdpyinfo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xdpyinfo-install:
	$(INSTALL_DIR) $(IDIR_XDPYINFO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xdpyinfo \
		$(IDIR_XDPYINFO)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
