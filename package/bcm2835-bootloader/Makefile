# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		bcm2835-bootloader
PKG_VERSION:=		9b068fe44503f564579a25fd849df4ec784f9d4d
PKG_RELEASE:=		3
PKG_DESCR:=		bootloader for raspberry pi
PKG_SECTION:=		base/boot
PKG_URL:=		https://github.com/raspberrypi/firmware
PKG_SITES:=		https://github.com/raspberrypi/firmware.git

PKG_SYSTEM_DEPENDS:=	raspberry-pi

PKG_CHOICES_BCM2835_BOOTLOADER:=	DEFAULT EXTRA CUTDOWN
PKGCD_DEFAULT:=		default bootloader
PKGCD_EXTRA:=		bootloader with extra features and codecs
PKGCD_CUTDOWN:=		cut down bootloader

PKG_SUBPKGS:=		BCM2835_BOOTLOADER BCM2835_DEBUGTOOL
PKGSD_BCM2835_DEBUGTOOL:=	debugtool
PKGSC_BCM2835_DEBUGTOOL:=	sys/hw

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BCM2835_BOOTLOADER,bcm2835-bootloader,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))
$(eval $(call PKG_template,BCM2835_DEBUGTOOL,bcm2835-debugtool,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKGSC_BCM2835_DEBUGTOOL)))

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
ifeq ($(ADK_KERNEL_BCM2708_DT),y)
	printf "device_tree=bcm2708-rpi-b.dtb\n" >> \
		$(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
	printf "device_tree_address=0x100\n" >> \
		$(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
	printf "kernel_address=0x8000\n" >> \
		$(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
	printf "disable_commandline_tags=2\n" >> \
		$(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
ifneq ($(ADK_KERNEL_SND_BCM2708_SOC_RPI_PROTO),)
	printf "dtparam=i2c=on,i2s=on,spi=on\n" >> \
		$(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
	printf "dtoverlay=rpi-proto\n" >> \
		$(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
	printf "dtdebug=on\n" >> \
		$(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
endif
else
	printf "device_tree=\n" >> \
		$(IDIR_BCM2835_BOOTLOADER)/boot/config.txt
endif
ifeq ($(ADK_PACKAGE_BCM2835_DEBUGTOOL),y)
	$(INSTALL_DIR) $(IDIR_BCM2835_DEBUGTOOL)/opt/vc/bin
	$(INSTALL_BIN) $(WRKBUILD)/hardfp/opt/vc/bin/vcdbg \
		$(IDIR_BCM2835_DEBUGTOOL)/opt/vc/bin
endif

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
