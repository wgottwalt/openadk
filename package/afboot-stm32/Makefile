# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		afboot-stm32
PKG_VERSION:=		f7f109f0c6f65534ae50f9243a7356c5002a9b87
PKG_RELEASE:=		1
PKG_DESCR:=		bootloader for stm32 devices
PKG_SECTION:=		base/boot
PKG_SITES:=		https://github.com/mcoquelin-stm32/afboot-stm32.git

PKG_SYSTEM_DEPENDS:=	st-stm32f429

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AFBOOT_STM32,afboot-stm32,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

afboot-stm32-install:
	$(CP) $(WRKBUILD)/stm32f429i-disco.bin $(FW_DIR)

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
