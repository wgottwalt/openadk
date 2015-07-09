# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		bcm28xx-bootloader
PKG_VERSION:=		89881b5488a5a60088677333dcbd97e1836c0e7e
PKG_RELEASE:=		1
PKG_DESCR:=		bootloader for bcm28xx
PKG_SECTION:=		base/boot
PKG_URL:=		https://github.com/raspberrypi/firmware
PKG_SITES:=		https://github.com/raspberrypi/firmware.git

PKG_SYSTEM_DEPENDS:=	raspberry-pi raspberry-pi2

PKG_CHOICES_BCM28XX_BOOTLOADER:=	DEFAULT EXTRA CUTDOWN
PKGCD_DEFAULT:=		default bootloader
PKGCD_EXTRA:=		bootloader with extra features and codecs
PKGCD_CUTDOWN:=		cut down bootloader

PKG_SUBPKGS:=		BCM28XX_BOOTLOADER BCM28XX_DEBUGTOOL
PKGSD_BCM28XX_DEBUGTOOL:=	debugtool
PKGSC_BCM28XX_DEBUGTOOL:=	sys/hw
PKGSS_BCM28XX_DEBUGTOOL:=	bcm28xx-vc-debug

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BCM28XX_BOOTLOADER,bcm28xx-bootloader,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))
$(eval $(call PKG_template,BCM28XX_DEBUGTOOL,bcm28xx-debugtool,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKGSC_BCM28XX_DEBUGTOOL)))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

CMDLINE:=root=/dev/mmcblk0p2 rootfstype=ext4 rootwait
ifeq ($(ADK_APPLIANCE_KODI),y)
CMDLINE+=consoleblank=0 vt.global_cursor_default=0
endif
ifeq ($(ADK_RUNTIME_VERBOSE_KERNEL_SERIAL_ONLY),y)
CMDLINE+=console=ttyAMA0,$(ADK_RUNTIME_CONSOLE_SERIAL_SPEED)
endif
ifeq ($(ADK_RUNTIME_VERBOSE_KERNEL_VGA_ONLY),y)
CMDLINE+=console=$(ADK_RUNTIME_CONSOLE_VGA_DEVICE)
endif
ifeq ($(ADK_RUNTIME_VERBOSE_KERNEL_SERIAL_VGA),y)
CMDLINE+=console=ttyAMA0,$(ADK_RUNTIME_CONSOLE_SERIAL_SPEED) console=$(ADK_RUNTIME_CONSOLE_VGA_DEVICE)
endif
ifeq ($(ADK_RUNTIME_VERBOSE_KERNEL_VGA_SERIAL),y)
CMDLINE+=console=$(ADK_RUNTIME_CONSOLE_VGA_DEVICE) console=ttyAMA0,$(ADK_RUNTIME_CONSOLE_SERIAL_SPEED)
endif

do-install:
	$(INSTALL_DIR) $(IDIR_BCM28XX_BOOTLOADER)/boot
	$(CP) $(WRKBUILD)/boot/bootcode.bin $(IDIR_BCM28XX_BOOTLOADER)/boot/
	printf "$(CMDLINE)\n" > $(IDIR_BCM28XX_BOOTLOADER)/boot/cmdline.txt
	printf "kernel=kernel\n" > $(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
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
	printf "dtparam=i2s=on,spi=on,i2c_arm=on\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
	printf "gpu_mem=$(ADK_TARGET_GPU_MEM)\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
ifneq ($(ADK_KERNEL_SND_BCM2708_SOC_HIFIBERRY_AMP),)
	printf "dtoverlay=hifiberry-amp\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifneq ($(ADK_KERNEL_SND_BCM2708_SOC_HIFIBERRY_DAC),)
	printf "dtoverlay=hifiberry-dac\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifneq ($(ADK_KERNEL_SND_BCM2708_SOC_HIFIBERRY_DIGI),)
	printf "dtoverlay=hifiberry-digi\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifneq ($(ADK_KERNEL_SND_BCM2708_SOC_RPI_DAC),)
	printf "dtoverlay=rpi-dac\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifneq ($(ADK_KERNEL_SND_BCM2708_SOC_IQAUDIO_DAC),)
	printf "dtoverlay=iqaudio-dac\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifneq ($(ADK_KERNEL_SND_BCM2708_SOC_RPI_PROTO),)
	printf "dtoverlay=rpi-proto\n" >> \
		$(IDIR_BCM28XX_BOOTLOADER)/boot/config.txt
endif
ifeq ($(ADK_PACKAGE_BCM28XX_DEBUGTOOL),y)
	$(INSTALL_DIR) $(IDIR_BCM28XX_DEBUGTOOL)/opt/vc/bin
	$(INSTALL_BIN) $(WRKBUILD)/hardfp/opt/vc/bin/vcdbg \
		$(IDIR_BCM28XX_DEBUGTOOL)/opt/vc/bin
endif

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
