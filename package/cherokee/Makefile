# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cherokee
PKG_VERSION:=		1.2.101
PKG_RELEASE:=		1
PKG_MD5SUM:=		ef47003355a2e368e4d9596cd070ef23
PKG_DESCR:=		small and fast webserver
PKG_SECTION:=		www
PKG_URL:=		http://www.cherokee-project.com
PKG_SITES:=		http://www.cherokee-project.de/mirrors/cherokee/1.2/${PKG_VERSION}/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CHEROKEE,cherokee,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-static-module=all \
			--without-ffmpeg

cherokee-install:
	$(INSTALL_DIR) $(IDIR_CHEROKEE)/etc/cherokee
	$(INSTALL_DATA) ./files/cherokee.conf \
		$(IDIR_CHEROKEE)/etc/cherokee
	$(INSTALL_DIR) $(IDIR_CHEROKEE)/usr/lib/cherokee
	$(CP) $(WRKINST)/usr/lib/libcherokee*so* \
		$(IDIR_CHEROKEE)/usr/lib
	$(INSTALL_DIR) $(IDIR_CHEROKEE)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/cherokee{,-worker} \
		$(IDIR_CHEROKEE)/usr/sbin
	$(INSTALL_DIR) $(IDIR_CHEROKEE)/usr/share/cherokee/themes/default
	$(CP) $(WRKINST)/usr/share/cherokee/themes/default/* \
		$(IDIR_CHEROKEE)/usr/share/cherokee/themes/default

include ${TOPDIR}/mk/pkg-bottom.mk
