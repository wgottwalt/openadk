# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		dmidecode
PKG_VERSION:=		3.1
PKG_RELEASE:=		1
PKG_HASH:=		b5ffe3e9d9b70addc0e84dc4a955ac1005d5ad07ec0dbf98b5ea208480711bc0
PKG_DESCR:=		reports information about your system's hardware
PKG_SECTION:=		sys/hw
PKG_URL:=		http://www.nongnu.org/dmidecode/
PKG_SITES:=		http://download.savannah.gnu.org/releases/dmidecode/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DMIDECODE,dmidecode,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

dmidecode-install:
	$(INSTALL_DIR) $(IDIR_DMIDECODE)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/dmidecode \
		$(IDIR_DMIDECODE)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
