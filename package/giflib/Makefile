# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		giflib
PKG_VERSION:=		4.1.6
PKG_RELEASE:=		3
PKG_HASH:=		ceca77dcd29eb6f6d0336414dfecc9094413f71c3b589afcf96bb72fbfb08ce0
PKG_DESCR:=		gif graphics library
PKG_SECTION:=		libs/image
PKG_URL:=		http://sourceforge.net/projects/giflib/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=giflib/giflib%204.x/$(PKG_NAME)-$(PKG_VERSION)/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GIFLIB,giflib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

giflib-install:
	$(INSTALL_DIR) $(IDIR_GIFLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgif.so* \
		$(IDIR_GIFLIB)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
