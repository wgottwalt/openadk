# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gradm
PKG_VERSION:=		3.0
PKG_RELEASE:=		1
PKG_HASH:=		4ee8a4e3a658f14b58c55fb8c5a9d3234e0ec87cf90a886499918553a15c557a
PKG_DESCR:=		rbac administration utility
PKG_SECTION:=		sys/misc
PKG_URL:=		http://grsecurity.net/
PKG_SITES:=		http://grsecurity.net/stable/

WRKDIST=		${WRKDIR}/${PKG_NAME}
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-201405281853.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GRADM,gradm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		BISON=bison FLEX=flex

gradm-install:
	$(INSTALL_DIR) $(IDIR_GRADM)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/sbin/gr* \
		$(IDIR_GRADM)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
