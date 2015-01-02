# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		u-boot
PKG_VERSION:=		d8bec60c1b0de7770f9b56ad092ab9be801d99af
PKG_RELEASE:=		1
PKG_HASH:=		21108ec5accf0737859834f051aef02d26163e0c0b41da265ea8f64e4af17a5e
PKG_DESCR:=		portable bootloader
PKG_SECTION:=		base/boot
PKG_URL:=		http://www.denx.de/wiki/U-Boot	
PKG_SITES:=		git://git.denx.de/u-boot.git

PKG_SYSTEM_DEPENDS:=	raspberry-pi

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,U_BOOT,u-boot,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,U_BOOT,u-boot,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
CONFIG:=		rpi_defconfig
endif

HOST_STYLE:=		manual
CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

host-build:
	(cd $(WRKBUILD) && env $(HOST_MAKE_ENV) $(MAKE) -f $(MAKE_FILE) \
		$(HOST_MAKE_FLAGS) sandbox_defconfig )
	(cd $(WRKBUILD) && env $(HOST_MAKE_ENV) $(MAKE) -f $(MAKE_FILE) \
		$(HOST_MAKE_FLAGS) tools $(MAKE_TRACE) )

u-boot-hostinstall:
	$(INSTALL_BIN) $(WRKBUILD)/tools/mkimage \
		$(STAGING_HOST_DIR)/usr/bin

do-configure:
	(cd $(WRKBUILD) && $(MAKE) $(CONFIG))

do-build:
	(cd $(WRKBUILD) && env CROSS_COMPILE='$(TARGET_CROSS)' \
		GCC_HONOUR_COPTS=s $(MAKE))

u-boot-install:
	$(CP) $(WRKBUILD)/u-boot $(FW_DIR)

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
