# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		drbd-utils
PKG_VERSION:=		8.9.6
PKG_RELEASE:=		1
PKG_HASH:=		297b77c9b3f88de2e7dae459234f2753ea4fc2805282b2d276e35cf51e292913
PKG_DESCR:=		admin tools for drbd-utils
PKG_SECTION:=		sys/fs
PKG_SITES:=		http://oss.linbit.com/drbd/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DRBD_UTILS,drbd-utils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GENETLINK_H=$(STAGING_TARGET_DIR)/usr/include/linux/genetlink.h
CONFIGURE_ARGS+=	--with-distro=generic \
			--without-manual \
			--with-pacemaker \
			--without-heartbeat \
			--without-km \
			--without-xen \
			--without-udev

drbd-utils-install:
	$(INSTALL_DIR) $(IDIR_DRBD_UTILS)/etc
	$(CP) ./files/drbd.conf $(IDIR_DRBD_UTILS)/etc
	$(INSTALL_DIR) $(IDIR_DRBD_UTILS)/usr/lib/drbd
	$(INSTALL_DIR) $(IDIR_DRBD_UTILS)/usr/sbin
	$(CP) $(WRKINST)/usr/lib/drbd/* \
		$(IDIR_DRBD_UTILS)/usr/lib/drbd/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/drbd* \
		$(IDIR_DRBD_UTILS)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
