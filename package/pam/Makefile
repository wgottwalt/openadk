# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pam
PKG_VERSION:=		1.1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		ff8f3c4382b78ac211e11bcd56ab17bf
PKG_DESCR:=		Pluggable Authentication Modules
PKG_BUILDDEP:=		flex
PKG_SECTION:=		misc
PKG_SITES:=		http://openadk.org/distfiles/

DISTFILES:=		Linux-PAM-$(PKG_VERSION).tar.gz
WRKDIST=                ${WRKDIR}/Linux-PAM-${PKG_VERSION}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PAM,pam,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIGURE_ARGS+=	--disable-nis \
			--enable-db=no

pam-install:
	$(INSTALL_DIR) $(IDIR_PAM)/etc/security
	$(CP) $(WRKINST)/etc/security/* $(IDIR_PAM)/etc/security
	$(INSTALL_DIR) $(IDIR_PAM)/lib/security
	$(CP) $(WRKINST)/lib/libpam*.so* $(IDIR_PAM)/lib
	$(CP) $(WRKINST)/lib/security/*.so* $(IDIR_PAM)/lib/security
	$(CP) $(WRKBUILD)/conf/pam.conf $(IDIR_PAM)/etc
	# /lib is not automatically installed to staging area
	$(CP) $(WRKINST)/lib/libpam*.so* $(STAGING_DIR)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
