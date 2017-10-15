# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pam
PKG_VERSION:=		1.1.8
PKG_RELEASE:=		3
PKG_HASH:=		4183409a450708a976eca5af561dbf4f0490141a08e86e4a1e649c7c1b094876
PKG_DESCR:=		pluggable authentication modules
PKG_BUILDDEP:=		flex
PKG_SECTION:=		sys/misc
PKG_URL:=		http://www.linux-pam.org/
PKG_SITES:=		http://www.linux-pam.org/library/
PKG_OPTS:=		dev
PKG_BB:=		1

DISTFILES:=		Linux-PAM-$(PKG_VERSION).tar.gz
WRKDIST=                ${WRKDIR}/Linux-PAM-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PAM,pam,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-nis \
			--disable-regenerate-docu \
			--enable-db=no

pam-install:
	$(INSTALL_DIR) $(STAGING_TARGET_DIR)/usr/lib
	$(CP) $(WRKINST)/lib/libpam*.so* \
			$(STAGING_TARGET_DIR)/usr/lib
	$(INSTALL_DIR) $(IDIR_PAM)/etc/security
	$(CP) $(WRKINST)/etc/security/* $(IDIR_PAM)/etc/security
	$(INSTALL_DIR) $(IDIR_PAM)/lib/security
	$(CP) $(WRKINST)/lib/libpam*.so* $(IDIR_PAM)/lib
	$(CP) $(WRKINST)/lib/security/*.so* $(IDIR_PAM)/lib/security
	$(CP) ./files/pam.conf $(IDIR_PAM)/etc

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
