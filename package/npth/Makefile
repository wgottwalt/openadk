# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		npth
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_HASH:=		6ddbdddb2cf49a4723f9d1ad6563c480d6760dcb63cb7726b8fc3bc2e1b6c08a
PKG_DESCR:=		non-preemptive threads implementation
PKG_SECTION:=		libs/misc
PKG_URL:=		https://www.gnupg.org/related_software/npth/index.html
PKG_SITES:=		https://www.gnupg.org/ftp/gcrypt/npth/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NPTH,npth,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

npth-install:
	$(INSTALL_DIR) $(IDIR_NPTH)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnpth*.so* \
		$(IDIR_NPTH)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
