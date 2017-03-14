# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		bcm28xx-bootloader
PKG_VERSION:=		4e156d57556e1c7b0fff37e088d9de1f362da6df
PKG_RELEASE:=		1
PKG_DESCR:=		bootloader for bcm28xx
PKG_SECTION:=		base/boot
PKG_URL:=		https://github.com/raspberrypi/firmware
PKG_SITES:=		https://github.com/raspberrypi/firmware.git

PKG_SYSTEM_DEPENDS:=	raspberry-pi raspberry-pi2 raspberry-pi3

PKG_CHOICES_BCM28XX_BOOTLOADER:=	DEFAULT EXTRA CUTDOWN
PKGCD_DEFAULT:=		default bootloader
PKGCD_EXTRA:=		bootloader with extra features and codecs
PKGCD_CUTDOWN:=		cut down bootloader

PKG_SUBPKGS:=		BCM28XX_BOOTLOADER BCM28XX_DEBUGTOOL
PKGSD_BCM28XX_DEBUGTOOL:=	debugtool
PKGSC_BCM28XX_DEBUGTOOL:=	sys/hw
PKGSS_BCM28XX_DEBUGTOOL:=	bcm28xx-vc-debug

NO_DISTFILES:=		1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BCM28XX_BOOTLOADER,bcm28xx-bootloader,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))
$(eval $(call PKG_template,BCM28XX_DEBUGTOOL,bcm28xx-debugtool,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKGSC_BCM28XX_DEBUGTOOL)))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	$(INSTALL_DIR) $(IDIR_BCM28XX_BOOTLOADER)/boot
	$(CP) $(WRKBUILD)/boot/bootcode.bin $(IDIR_BCM28XX_BOOTLOADER)/boot/
	printf "kernel=kernel\n" > $(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
	printf "dtparam=audio,i2s,spi,i2c\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
ifeq ($(ADK_PACKAGE_BCM28XX_BOOTLOADER_DEFAULT),y)
	$(CP) $(WRKBUILD)/boot/{start.elf,fixup.dat} $(IDIR_BCM28XX_BOOTLOADER)/boot/
	printf "start_file=start.elf\n" >> $(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
	printf "fixup_file=fixup.dat\n" >> $(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifeq ($(ADK_PACKAGE_BCM28XX_BOOTLOADER_EXTRA),y)
	$(CP) $(WRKBUILD)/boot/{start_x.elf,fixup_x.dat} $(IDIR_BCM28XX_BOOTLOADER)/boot/
	printf "start_file=start_x.elf\n" >> $(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
	printf "fixup_file=fixup_x.dat\n" >> $(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifeq ($(ADK_PACKAGE_BCM28XX_BOOTLOADER_CUTDOWN),y)
	$(CP) $(WRKBUILD)/boot/{start_cd.elf,fixup_cd.dat} $(IDIR_BCM28XX_BOOTLOADER)/boot/
	printf "start_file=start_cd.elf\n" >> $(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
	printf "fixup_file=fixup_cd.dat\n" >> $(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
	printf "gpu_mem=$(ADK_TARGET_GPU_MEM)\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
ifneq ($(ADK_TARGET_HARDWARE_HIFIBERRY_AMP),)
	printf "dtoverlay=hifiberry-amp\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifneq ($(ADK_TARGET_HARDWARE_HIFIBERRY_DAC),)
	printf "dtoverlay=hifiberry-dac\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifneq ($(ADK_TARGET_HARDWARE_HIFIBERRY_DIGI),)
	printf "dtoverlay=hifiberry-digi\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifneq ($(ADK_TARGET_HARDWARE_RPI_DAC),)
	printf "dtoverlay=rpi-dac\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifneq ($(ADK_TARGET_HARDWARE_IQAUDIO_DAC),)
	printf "dtoverlay=iqaudio-dac\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifneq ($(ADK_TARGET_HARDWARE_RPI_PROTO),)
	printf "dtoverlay=rpi-proto\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifeq ($(ADK_PACKAGE_BCM28XX_DEBUGTOOL),y)
	$(INSTALL_DIR) $(IDIR_BCM28XX_DEBUGTOOL)/opt/vc/bin
	$(INSTALL_BIN) ./files/vcdbg \
		$(IDIR_BCM28XX_DEBUGTOOL)/opt/vc/bin
endif

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
