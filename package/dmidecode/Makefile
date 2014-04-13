# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		dmidecode
PKG_VERSION:=		2.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		9fddbbc3e330bee5950b8b5d424a57cb
PKG_DESCR:=		reports information about your system's hardware
PKG_SECTION:=		misc
PKG_URL:=		http://www.nongnu.org/dmidecode/
PKG_SITES:=		http://download.savannah.gnu.org/releases/dmidecode/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DMIDECODE,dmidecode,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

ifeq ($(ADK_TOOLCHAIN_USE_SSP),y)
TARGET_LDFLAGS+=        -lssp
endif

dmidecode-install:
	$(INSTALL_DIR) $(IDIR_DMIDECODE)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/dmidecode \
		$(IDIR_DMIDECODE)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
