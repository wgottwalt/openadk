# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lame
PKG_VERSION:=		398-2
PKG_RELEASE:=		1
PKG_MD5SUM:=		719dae0ee675d0c16e0e89952930ed35
PKG_DESCR:=		LAME MP3 encoder
PKG_SECTION:=		sound
PKG_DEPENDS:=		libncurses
PKG_URL:=		http://lame.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=lame/}

PKG_DESCR_1:=		LAME MP3 encoding library
PKG_SECTION_1:=		libs

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LAME,lame,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBLAME,liblame,$(PKG_VERSION)-${PKG_RELEASE},,${PKG_DESCR_1},${PKG_SECTION_1}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_LAME)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lame $(IDIR_LAME)/usr/bin/
	$(INSTALL_DIR) $(IDIR_LIBLAME)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib*.so* $(IDIR_LIBLAME)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
