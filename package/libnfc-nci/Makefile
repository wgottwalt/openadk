# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnfc-nci
PKG_VERSION:=		fbad2fb842f2b4e7cfd5bc82136a9381402c07ce
PKG_RELEASE:=		1
PKG_GIT:=		hash
PKG_DESCR:=		nfc nci library
PKG_SECTION:=		libs/net
PKG_NEEDS:=		threads c++
PKG_URL:=		https://github.com/NXPNFCLinux/linux_libnfc-nci
PKG_SITES:=		https://github.com/NXPNFCLinux/linux_libnfc-nci.git
PKG_OPTS:=		dev

PKG_LIBC_DEPENDS:=	glibc uclibc-ng

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNFC_NCI,libnfc-nci,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

AUTOTOOL_STYLE:=	bootstrap

libnfc-nci-install:
	$(INSTALL_DIR) $(IDIR_LIBNFC_NCI)/etc
	$(INSTALL_DIR) $(IDIR_LIBNFC_NCI)/usr/lib
	$(INSTALL_DIR) $(IDIR_LIBNFC_NCI)/usr/sbin
	$(CP) $(WRKINST)/usr/lib/libnfc*.so* \
		$(IDIR_LIBNFC_NCI)/usr/lib
	$(CP) $(WRKINST)/usr/sbin/nfcDemoApp \
		$(IDIR_LIBNFC_NCI)/usr/sbin
	$(CP) $(WRKINST)/etc/libnfc* \
		$(IDIR_LIBNFC_NCI)/etc

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
