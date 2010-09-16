# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mpc
PKG_VERSION:=		0.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		08af459a18388c35dd81de8f9f1534c9
PKG_DESCR:=		music player client
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libmpdclient
PKG_BUILDDEP:=		libmpdclient
PKG_URL:=		http://mpd.wikia.com/wiki/Client:Mpc
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=musicpd/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MPC,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-iconv

post-install:
	$(INSTALL_DIR) $(IDIR_MPC)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mpc \
		$(IDIR_MPC)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
