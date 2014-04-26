# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mpc
PKG_VERSION:=		0.25
PKG_RELEASE:=		1
PKG_MD5SUM:=		76aec8e973e3c6c131e9e9f2ad8f34c3
PKG_DESCR:=		music player client
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libmpdclient
PKG_BUILDDEP:=		libmpdclient
PKG_URL:=		http://www.musicpd.org/
PKG_SITES:=		http://www.musicpd.org/download/mpc/0/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MPC,mpc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-iconv
CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no

mpc-install:
	$(INSTALL_DIR) $(IDIR_MPC)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mpc \
		$(IDIR_MPC)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
