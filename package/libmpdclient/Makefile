# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libmpdclient
PKG_VERSION:=		2.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		f1a8cbbb4d52ace87df0f6a1097e7c8a
PKG_DESCR:=		library for interfacing MPD
PKG_SECTION:=		libs
PKG_URL:=		http://mpd.wikia.com/wiki/ClientLib:libmpdclient
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=musicpd/}

PKG_SUBPKGS:=		LIBMPDCLIENT LIBMPDCLIENT_DEV
PKGSD_LIBMPDCLIENT_DEV:=headers for interfacing MPD
PKGSC_LIBMPDCLIENT_DEV:=devel
PKGSS_LIBMPDCLIENT_DEV:=libmpdclient

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMPDCLIENT,libmpdclient,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBMPDCLIENT_DEV,libmpdclient-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_LIBMPDCLIENT_DEV},${PKGSD_LIBMPDCLIENT_DEV},${PKGSC_LIBMPDCLIENT_DEV}))

CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no

libmpdclient-install:
	$(INSTALL_DIR) $(IDIR_LIBMPDCLIENT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmpdclient*.so* \
		$(IDIR_LIBMPDCLIENT)/usr/lib

libmpdclient-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBMPDCLIENT_DEV)/usr/include
	${CP} $(WRKINST)/usr/include/* \
		$(IDIR_LIBMPDCLIENT_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_LIBMPDCLIENT_DEV)/usr/lib/pkgconfig
	$(CP) $(WRKINST)/usr/lib/pkgconfig/*.pc \
		$(IDIR_LIBMPDCLIENT_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
