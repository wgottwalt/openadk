# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libmicrohttpd
PKG_VERSION:=		0.9.42
PKG_RELEASE:=		1
PKG_HASH:=		00352073367003da40607319e4090a6a8308748b59246ae80e9871f34dad7d5b
PKG_DESCR:=		library make it easy to run an webserver
PKG_SECTION:=		libs/net
PKG_URL:=		http://www.gnu.org/software/libmicrohttpd/
PKG_SITES:=		${MASTER_SITE_GNU:=libmicrohttpd/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMICROHTTPD,libmicrohttpd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-spdy

libmicrohttpd-install:
	$(INSTALL_DIR) $(IDIR_LIBMICROHTTPD)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmicrohttpd*.so* \
		$(IDIR_LIBMICROHTTPD)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
