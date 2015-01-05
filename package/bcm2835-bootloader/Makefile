# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		bcm2835-bootloader
PKG_VERSION:=		393dcc0e76f18f6ac1b67ba45d36058410670034
PKG_RELEASE:=		1
PKG_DESCR:=		bootloader for raspberry pi
PKG_SECTION:=		base/boot
PKG_URL:=		https://github.com/raspberrypi/firmware
PKG_SITES:=		https://github.com/raspberrypi/firmware.git
NO_CHECKSUM:=		1

PKG_SYSTEM_DEPENDS:=	raspberry-pi
PKG_CHOICES_BCM2835_BOOTLOADER:=	DEFAULT EXTRA CUTDOWN
PKGCD_DEFAULT:=		default bootloader
PKGCD_EXTRA:=		bootloader with extra features and codecs
PKGCD_CUTDOWN:=		cut down bootloader

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BCM2835_BOOTLOADER,bcm2835-bootloader,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	$(INSTALL_DIR) $(IDIR_BCM2835_BOOTLOADER)/boot
	$(CP) $(WRKBUILD)/boot/bootcode.bin $(IDIR_BCM2835_BOOTLOADER)/boot/
	printf "kernel=kernel\n" > $(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
ifeq ($(ADK_PACKAGE_BCM2835_BOOTLOADER_DEFAULT),y)
	$(CP) $(WRKBUILD)/boot/{start.elf,fixup.dat} $(IDIR_BCM2835_BOOTLOADER)/boot/
	printf "start_file=start.elf\n" >> $(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
	printf "fixup_file=fixup.dat\n" >> $(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
endif
ifeq ($(ADK_PACKAGE_BCM2835_BOOTLOADER_EXTRA),y)
	$(CP) $(WRKBUILD)/boot/{start_x.elf,fixup_x.dat} $(IDIR_BCM2835_BOOTLOADER)/boot/
	printf "start_file=start_x.elf\n" >> $(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
	printf "fixup_file=fixup_x.dat\n" >> $(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
endif
ifeq ($(ADK_PACKAGE_BCM2835_BOOTLOADER_CUTDOWN),y)
	$(CP) $(WRKBUILD)/boot/{start_cd.elf,fixup_cd.dat} $(IDIR_BCM2835_BOOTLOADER)/boot/
	printf "start_file=start_cd.elf\n" >> $(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
	printf "fixup_file=fixup_cd.dat\n" >> $(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
endif
	printf "gpu_mem=$(ADK_TARGET_GPU_MEM)\n" >> \
		$(IDIR_BCM2835_BOOTLOADER)/boot/config.txt

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
