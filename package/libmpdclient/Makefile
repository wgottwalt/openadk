# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libmpdclient
PKG_VERSION:=		2.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		4b101a36e5c0cf967dc063391260ddbf
PKG_DESCR:=		library for interfacing MPD
PKG_SECTION:=		libs
PKG_URL:=		http://www.musicpd.org/
PKG_SITES:=		http://www.musicpd.org/download/libmpdclient/2/
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMPDCLIENT,libmpdclient,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--disable-documentation

libmpdclient-install:
	$(INSTALL_DIR) $(IDIR_LIBMPDCLIENT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmpdclient*.so* \
		$(IDIR_LIBMPDCLIENT)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
