# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		barebox
PKG_VERSION:=		2017.02.0
PKG_RELEASE:=		1
PKG_HASH:=		d65d864fe598d61ed9c6712e32d50742e6996aae02acaae5955c3b22166344cb
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

ifeq ($(ADK_TARGET_SYSTEM_QEMU_MIPS),y)
CONFIG:=		qemu-malta_defconfig
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_VEXPRESS_A9),y)
CONFIG:=		vexpress_ca9_defconfig
endif

do-configure:
	(cd $(WRKBUILD) && $(MAKE) ARCH='$(ADK_TARGET_ARCH)' $(CONFIG))

do-build:
	(cd $(WRKBUILD) && env \
		PATH='$(HOST_PATH)' \
		ARCH='$(ADK_TARGET_ARCH)' \
		CROSS_COMPILE='$(TARGET_CROSS)' \
		GCC_HONOUR_COPTS=s \
		$(MAKE))

barebox-install:
	$(INSTALL_DIR) $(IDIR_BAREBOX)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
