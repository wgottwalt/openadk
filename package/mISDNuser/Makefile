# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mISDNuser
PKG_VERSION:=		1_1_9
PKG_RELEASE:=		1
PKG_MD5SUM:=		e174a60e7040c88d1184364714e55c1b
PKG_DESCR:=		misdn kernel link library and includes, this is the out-of-tree version
PKG_SECTION:=		net/voip
PKG_DEPENDS:=		misdn
PKG_BUILDDEP:=		mISDN
PKG_URL:=		http://www.misdn.org
PKG_SITES:=		http://www.misdn.org/downloads/releases/
PKG_NOPARALLEL:=	1

PKG_CFLINE_MISDNUSER:=	depends on ADK_BROKEN

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MISDNUSER,misdnuser,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		MISDNDIR=$(STAGING_TARGET_DIR)/usr INSTALL_PREFIX=$(WRKINST)

misdnuser-install:
	$(INSTALL_DIR) $(IDIR_MISDNUSER)/usr/{bin,lib}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{loadfirm,mISDNdebugtool,misdnportinfo} \
		$(IDIR_MISDNUSER)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{sendhwctrl,testcon*,testlayer*} \
		$(IDIR_MISDNUSER)/usr/bin/
	$(CP) $(WRKINST)/usr/lib/*.so* $(IDIR_MISDNUSER)/usr/lib/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
