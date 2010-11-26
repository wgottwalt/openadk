# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		drbd
PKG_VERSION:=		8.3.8.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		551dae488006af86a33eab1eba407f48
PKG_DESCR:=		DRBD admin tools
PKG_SECTION:=		fs
PKG_URL:=		http://www.drbd.org/
PKG_SITES:=		http://oss.linbit.com/drbd/8.3/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DRBD,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-distro=generic \
			--without-km \
			--without-xen \
			--without-udev

post-install:
	$(INSTALL_DIR) $(IDIR_DRBD)/usr/lib/drbd
	$(INSTALL_DIR) $(IDIR_DRBD)/usr/sbin
	$(CP) $(WRKINST)/usr/lib/drbd/* \
		$(IDIR_DRBD)/usr/lib/drbd/
	$(INSTALL_BIN) $(WRKINST)/sbin/drbd* \
		$(IDIR_DRBD)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
