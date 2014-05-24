# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		rfkill
PKG_VERSION:=		0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		ce834c00c049cd86a04ab115c92ef548
PKG_DESCR:=		radio frequency kill utility
PKG_SECTION:=		wifi
PKG_URL:=		https://www.kernel.org/pub/software/network/rfkill/
PKG_SITES:=		https://www.kernel.org/pub/software/network/rfkill/
PKG_BB:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RFKILL,rfkill,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

rfkill-install:
	$(INSTALL_DIR) $(IDIR_RFKILL)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/rfkill \
		$(IDIR_RFKILL)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
