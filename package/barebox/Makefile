# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		barebox
PKG_VERSION:=		2017.11.0
PKG_RELEASE:=		1
PKG_HASH:=		7dff97dd94807fd7c0012fd9ddb8bc799a220e2b65e46dcc56724105a56feecc
PKG_DESCR:=		portable bootloader
PKG_SECTION:=		base/boot
PKG_BUILDDEP:=		lzop-host
PKG_URL:=		http://www.barebox.org
PKG_SITES:=		http://www.barebox.org/download/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BAREBOX,barebox,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

TARGET_LDFLAGS:=
CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

BAREBOX_ARCH:=		$(ADK_TARGET_ARCH)
ifeq ($(ADK_TARGET_ARCH_X86),y)
CONFIG:=		efi_defconfig
endif
ifeq ($(ADK_TARGET_ARCH_X86_64),y)
CONFIG:=		efi_defconfig
BAREBOX_ARCH:=		x86
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_MIPS),y)
CONFIG:=		qemu-malta_defconfig
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_VEXPRESS_A9),y)
CONFIG:=		vexpress_ca9_defconfig
endif

do-configure:
	(cd $(WRKBUILD) && $(MAKE) ARCH=$(BAREBOX_ARCH) $(CONFIG))

do-build:
	(cd $(WRKBUILD) && env \
		PATH='$(HOST_PATH)' \
		ARCH=$(BAREBOX_ARCH) \
		CROSS_COMPILE='$(TARGET_CROSS)' \
		$(MAKE))

barebox-install:
	$(INSTALL_DIR) $(IDIR_BAREBOX)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
