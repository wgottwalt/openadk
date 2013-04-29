# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libmpdclient
PKG_VERSION:=		2.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		79f6c810c291fa4f382a92c8e25123de
PKG_DESCR:=		library for interfacing MPD
PKG_SECTION:=		libs
PKG_URL:=		http://www.musicpd.org/
PKG_SITES:=		http://www.musicpd.org/download/libmpdclient/2/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_SUBPKGS:=		LIBMPDCLIENT LIBMPDCLIENT_DEV
PKGSD_LIBMPDCLIENT_DEV:=headers for interfacing MPD
PKGSC_LIBMPDCLIENT_DEV:=devel
PKGSS_LIBMPDCLIENT_DEV:=libmpdclient

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMPDCLIENT,libmpdclient,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBMPDCLIENT_DEV,libmpdclient-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_LIBMPDCLIENT_DEV},${PKGSD_LIBMPDCLIENT_DEV},${PKGSC_LIBMPDCLIENT_DEV}))

CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--disable-documentation

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
