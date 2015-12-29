# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xvinfo
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		1
PKG_HASH:=		1c1c2f97abfe114389e94399cc7bf3dfd802ed30ad41ba23921d005bd8a6c39f
PKG_DESCR:=		print out x-video extension adaptor information
PKG_SECTION:=		x11/utils
PKG_BUILDDEP:=		libXv
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://www.x.org/releases/individual/app/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XVINFO,xvinfo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xvinfo-install:
	$(INSTALL_DIR) $(IDIR_XVINFO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xvinfo \
		$(IDIR_XVINFO)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
