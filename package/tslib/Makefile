# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		tslib
PKG_VERSION:=		1.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		92b2eb55b1e4ef7e2c0347069389390e
PKG_DESCR:=		touchscreen library
PKG_SECTION:=		libs
PKG_URL:=		http://tslib.berlios.de/
PKG_SITES:=		http://download.berlios.de/tslib/ \
			http://download2.berlios.de/tslib/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TSLIB,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-ucb1x00 \
			--disable-corgi \
			--disable-collie \
			--disable-h3600 \
			--disable-mk712 \
			--disable-linear-h2200 \
			--disable-arctic2

post-install:
	$(INSTALL_DIR) $(IDIR_TSLIB)/etc
	$(INSTALL_DIR) $(IDIR_TSLIB)/usr/lib/ts
	$(INSTALL_DIR) $(IDIR_TSLIB)/usr/bin
	$(CP) $(WRKINST)/usr/lib/libts*so* $(IDIR_TSLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/ts/*.so $(IDIR_TSLIB)/usr/lib/ts
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ts_calibrate $(IDIR_TSLIB)/usr/bin
	$(INSTALL_DATA) $(WRKINST)/etc/ts.conf $(IDIR_TSLIB)/etc

include ${TOPDIR}/mk/pkg-bottom.mk
