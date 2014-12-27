# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mpc
PKG_VERSION:=		0.26
PKG_RELEASE:=		1
PKG_HASH:=		20735f7173cce56bec50c1d8b4633751052dc68365b29a6113206dc1cdc6e242
PKG_DESCR:=		music player client
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		libmpdclient
PKG_BUILDDEP:=		libmpdclient
PKG_URL:=		http://www.musicpd.org/
PKG_SITES:=		http://www.musicpd.org/download/mpc/0/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MPC,mpc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-iconv
CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no

mpc-install:
	$(INSTALL_DIR) $(IDIR_MPC)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mpc \
		$(IDIR_MPC)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
