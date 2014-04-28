# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xdpyinfo
PKG_VERSION:=		1.3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		588a84f9762c7e4e2b72508f16005b48
PKG_DESCR:=		X display info utility
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libxtst
PKG_BUILDDEP:=		libXtst
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XDPYINFO,xdpyinfo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xdpyinfo-install:
	$(INSTALL_DIR) $(IDIR_XDPYINFO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xdpyinfo \
		$(IDIR_XDPYINFO)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
