# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		drbd
PKG_VERSION:=		8.4.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		b51815343c1a9151e2936b3b97520388
PKG_DESCR:=		admin tools for drbd
PKG_SECTION:=		sys/fs
PKG_URL:=		http://www.drbd.org/
PKG_SITES:=		http://oss.linbit.com/drbd/8.4/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc glibc

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DRBD,drbd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GENETLINK_H=$(STAGING_TARGET_DIR)/usr/include/linux/genetlink.h
CONFIGURE_ARGS+=	--with-distro=generic \
			--with-pacemaker \
			--without-heartbeat \
			--without-km \
			--without-xen \
			--without-udev

drbd-install:
	$(INSTALL_DIR) $(IDIR_DRBD)/etc
	$(CP) ./files/drbd.conf $(IDIR_DRBD)/etc
	$(INSTALL_DIR) $(IDIR_DRBD)/usr/lib/drbd
	$(INSTALL_DIR) $(IDIR_DRBD)/usr/sbin
	$(CP) $(WRKINST)/usr/lib/drbd/* \
		$(IDIR_DRBD)/usr/lib/drbd/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/drbd* \
		$(IDIR_DRBD)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
