# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		dvhtool
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		1
PKG_HASH:=		3596c74c08ee8f2f19712e8f0ab1f7ff8c483de7bfc2f50d205a186f52896f02
PKG_DESCR:=		sgi disk volume header tool
PKG_SECTION:=		sys/fs
PKG_URL:=		https://www.linux-mips.org/wiki/Disk_Volume_Header
PKG_SITES:=		http://http.debian.net/debian/pool/main/d/dvhtool/

PKG_ARCH_DEPENDS:=	mips mips64

DISTFILES:=             $(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
WRKDIST=		$(WRKDIR)/$(PKG_NAME)-$(PKG_VERSION).orig

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DVHTOOL,dvhtool,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

AUTOTOOL_STYLE:=	autoreconf

dvhtool-install:
	$(INSTALL_DIR) $(IDIR_DVHTOOL)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/dvhtool \
		$(IDIR_DVHTOOL)/usr/sbin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
