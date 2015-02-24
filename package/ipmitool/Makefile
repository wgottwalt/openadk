# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ipmitool
PKG_VERSION:=		1.8.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		0f9b4758c2b7e8a7bafc2ead113b4bc6
PKG_DESCR:=		Utility for controlling IPMI enabled devices.
PKG_SECTION:=		net/misc
PKG_URL:=		http://ipmitool.sf.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ipmitool/}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,IPMITOOL,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_IPMITOOL)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ipmitool \
		$(IDIR_IPMITOOL)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
