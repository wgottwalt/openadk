# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		empty
PKG_VERSION:=		0.6.19b
PKG_RELEASE:=		1
PKG_HASH:=		05b7cb361ef815774abda325c09c573f8c9039ccbb71eedc743439e4637c314a
PKG_DESCR:=		similar to expect for interactive console apps
PKG_SECTION:=		sys/misc
PKG_URL:=		http://empty.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=empty/}

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tgz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EMPTY,empty,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	$(INSTALL_DIR) $(WRKINST)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/empty $(WRKINST)/usr/bin/empty

empty-install:
	$(INSTALL_DIR) $(IDIR_EMPTY)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/empty \
		$(IDIR_EMPTY)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
