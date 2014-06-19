# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		tslib
# actually git version from 28.10.2013
PKG_VERSION:=		1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		9563faf5cf9f111538b4f45778e7bb24
PKG_DESCR:=		touchscreen library
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		libstdcxx
PKG_URL:=		http://tslib.berlios.de/
PKG_SITES:=		http://openadk.org/distfiles/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TSLIB,tslib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-ucb1x00 \
			--disable-corgi \
			--disable-collie \
			--disable-h3600 \
			--disable-mk712 \
			--disable-linear-h2200 \
			--disable-arctic2

tslib-install:
	$(INSTALL_DIR) $(IDIR_TSLIB)/etc
	$(INSTALL_DIR) $(IDIR_TSLIB)/usr/lib/ts
	$(INSTALL_DIR) $(IDIR_TSLIB)/usr/bin
	$(CP) $(WRKINST)/usr/lib/libts*so* $(IDIR_TSLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/ts/*.so $(IDIR_TSLIB)/usr/lib/ts
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ts_calibrate $(IDIR_TSLIB)/usr/bin
	$(INSTALL_DATA) $(WRKINST)/etc/ts.conf $(IDIR_TSLIB)/etc

include ${TOPDIR}/mk/pkg-bottom.mk
