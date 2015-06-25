# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mpc
PKG_VERSION:=		0.27
PKG_RELEASE:=		1
PKG_HASH:=		45a2be0a6dea65ed43f631294c24e74b83c8ee66d1ba6ab47d0744ddb1e62064
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
