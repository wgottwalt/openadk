# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libmicrohttpd
PKG_VERSION:=		0.9.37
PKG_RELEASE:=		1
PKG_MD5SUM:=		fdf1e0534d83bbf2663f80fa7873be77
PKG_DESCR:=		library make it easy to run an webserver
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libgcrypt
PKG_BUILDDEP:=		libgcrypt
PKG_URL:=		http://www.gnu.org/software/libmicrohttpd/
PKG_SITES:=		${MASTER_SITE_GNU:=libmicrohttpd/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMICROHTTPD,libmicrohttpd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--with-libgcrypt-prefix=$(STAGING_TARGET_DIR)/usr \
			--disable-spdy

libmicrohttpd-install:
	$(INSTALL_DIR) $(IDIR_LIBMICROHTTPD)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmicrohttpd*.so* \
		$(IDIR_LIBMICROHTTPD)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
