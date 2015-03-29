# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libmpdclient
PKG_VERSION:=		2.10
PKG_RELEASE:=		1
PKG_HASH:=		4f08cde82dae70895f8e4532a6e9b54b201efd5591c6b5d6834895807ed2ff82
PKG_DESCR:=		library for interfacing music player daemon
PKG_SECTION:=		libs/audio
PKG_URL:=		http://www.musicpd.org/
PKG_SITES:=		http://www.musicpd.org/download/libmpdclient/2/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMPDCLIENT,libmpdclient,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--disable-documentation

libmpdclient-install:
	$(INSTALL_DIR) $(IDIR_LIBMPDCLIENT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmpdclient*.so* \
		$(IDIR_LIBMPDCLIENT)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
