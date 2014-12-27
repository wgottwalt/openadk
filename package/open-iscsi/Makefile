# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		open-iscsi
PKG_VERSION:=		2.0
PKG_EXTRAVER:=		871
PKG_RELEASE:=		1
PKG_HASH:=		bcea8746ae82f2ada7bc05d2aa59bcda1ca0d5197f05f2e16744aae59f0a7dcb
PKG_DESCR:=		iscsi utilities
PKG_SECTION:=		sys/fs
PKG_URL:=		http://www.open-iscsi.org/
PKG_SITES:=		http://www.open-iscsi.org/bits/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION)-$(PKG_EXTRAVER).tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-${PKG_EXTRAVER}

include $(ADK_TOPDIR)/mk/package.mk

ALL_TARGET:=		user
INSTALL_TARGET:=	install_user

$(eval $(call PKG_template,OPEN_ISCSI,open-iscsi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

open-iscsi-install:
	$(INSTALL_DIR) $(IDIR_OPEN_ISCSI)/sbin $(IDIR_OPEN_ISCSI)/etc/iscsi
	$(INSTALL_BIN) $(WRKINST)/sbin/* $(IDIR_OPEN_ISCSI)/sbin
	$(CP) $(WRKINST)/etc/iscsi/* $(IDIR_OPEN_ISCSI)/etc/iscsi

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
