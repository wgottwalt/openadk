# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libmpdclient
PKG_VERSION:=		2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		a157c1eb70502f1da8097477104e719e
PKG_DESCR:=		library for interfacing MPD
PKG_SECTION:=		libs
PKG_URL:=		http://mpd.wikia.com/wiki/ClientLib:libmpdclient
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=musicpd/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMPDCLIENT,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBMPDCLIENT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmpdclient*.so* \
		$(IDIR_LIBMPDCLIENT)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
