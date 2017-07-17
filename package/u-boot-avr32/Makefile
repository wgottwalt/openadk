# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		u-boot-avr32
PKG_VERSION:=		2017.05
PKG_RELEASE:=		1
PKG_HASH:=		c8373949d7f0de1059e507b83a655d4cea539f75dc66ccdbb27adbd38d83095e
PKG_DESCR:=		portable bootloader
PKG_SECTION:=		base/boot
HOST_BUILDDEP:=		libressl-host dtc-host
PKG_BUILDDEP:=		u-boot-host
PKG_URL:=		http://www.denx.de/wiki/U-Boot	
PKG_SITES:=		ftp://ftp.denx.de/pub/u-boot/

DISTFILES:=		u-boot-$(PKG_VERSION).tar.bz2

PKG_SYSTEM_DEPENDS:=	atmel-ngw100

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,U_BOOT_AVR32,u-boot-avr32,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,U_BOOT_AVR32,u-boot-avr32,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

UBOOT:=			u-boot.bin
ifeq ($(ADK_TARGET_SYSTEM_ATMEL_NGW100),y)
CONFIG:=		atngw100_defconfig
endif

HOST_MAKE_FLAGS+=	HOSTCFLAGS="$(HOST_CPPFLAGS) $(HOST_CFLAGS)" \
			HOSTLDFLAGS="$(HOST_LDFLAGS) -ldl"
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
	$(INSTALL_BIN) $(WRKBUILD)/tools/mk{,env}image \
		$(STAGING_HOST_DIR)/usr/bin

do-configure:
	(cd $(WRKBUILD) && $(MAKE) $(CONFIG))

do-build:
	(cd $(WRKBUILD) && env \
		PATH='$(HOST_PATH)' \
		CROSS_COMPILE='$(TARGET_CROSS)' \
		GCC_HONOUR_COPTS=s $(MAKE))
ifneq ($(OS_FOR_BUILD),Darwin)
	(cd $(WRKBUILD) && env \
		PATH='$(HOST_PATH)' \
		CROSS_COMPILE='$(TARGET_CROSS)' \
		GCC_HONOUR_COPTS=s $(MAKE) env)
endif

u-boot-install:
	$(CP) $(WRKBUILD)/$(UBOOT) $(FW_DIR)
	$(INSTALL_DIR) $(IDIR_U_BOOT)/etc
	$(CP) ./files/fw_env.config $(IDIR_U_BOOT)/etc
ifneq ($(OS_FOR_BUILD),Darwin)
	$(INSTALL_DIR) $(IDIR_U_BOOT)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/tools/env/fw_printenv \
		$(IDIR_U_BOOT)/usr/bin
	(cd $(IDIR_U_BOOT)/usr/bin && ln -sf fw_printenv fw_setenv)
	$(INSTALL_BIN) ./files/uboot_print_env $(IDIR_U_BOOT)/usr/bin
	$(INSTALL_BIN) ./files/uboot_set_env $(IDIR_U_BOOT)/usr/bin
endif
ifeq ($(ADK_TARGET_SYSTEM_BANANA_PRO),y)
	$(INSTALL_BIN) ./files/boot.script.bpi $(FW_DIR)
endif
ifeq ($(ADK_TARGET_SYSTEM_SOLIDRUN_CLEARFOG),y)
	$(INSTALL_BIN) ./files/boot.script.clearfog $(FW_DIR)
endif
ifeq ($(ADK_TARGET_SYSTEM_SOLIDRUN_IMX6),y)
	$(INSTALL_BIN) $(WRKBUILD)/SPL $(FW_DIR)
	$(INSTALL_BIN) ./files/boot.script.imx6 $(FW_DIR)
endif
ifeq ($(ADK_TARGET_SYSTEM_BEAGLEBONE_BLACK),y)
	$(CP) ./files/uEnv.txt.bbb $(FW_DIR)/uEnv.txt
	$(INSTALL_BIN) $(WRKBUILD)/MLO $(FW_DIR)
endif

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
