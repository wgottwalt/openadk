# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pam
PKG_VERSION:=		1.1.8
PKG_RELEASE:=		3
PKG_MD5SUM:=		5107bbf54042400b6200e8367cc7feef
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

post-install:
ifeq ($(ADK_TARGET_USE_STATIC_LIBS),)
	# /lib is not automatically installed to staging area
	$(CP) $(WRKINST)/lib/libpam*.so* $(STAGING_TARGET_DIR)/usr/lib
endif

pam-install:
	$(INSTALL_DIR) $(IDIR_PAM)/etc/security
	$(CP) $(WRKINST)/etc/security/* $(IDIR_PAM)/etc/security
	$(INSTALL_DIR) $(IDIR_PAM)/lib/security
	$(CP) $(WRKINST)/lib/libpam*.so* $(IDIR_PAM)/lib
	$(CP) $(WRKINST)/lib/security/*.so* $(IDIR_PAM)/lib/security
	$(CP) ./files/pam.conf $(IDIR_PAM)/etc

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
