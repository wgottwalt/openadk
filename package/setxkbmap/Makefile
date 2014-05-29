# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		setxkbmap
PKG_VERSION:=		1.3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		57380d069021c6b7d873bfab803e3105
PKG_DESCR:=		set keyboard utility
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		libxkbfile
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SETXKBMAP,setxkbmap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

setxkbmap-install:
	$(INSTALL_DIR) $(IDIR_SETXKBMAP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/setxkbmap \
		$(IDIR_SETXKBMAP)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
