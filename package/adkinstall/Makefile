# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		adkinstall
PKG_VERSION:=		2.0
PKG_RELEASE:=		1
PKG_DESCR:=		adk disk/flash installer
PKG_SECTION:=		base/misc
PKG_DEPENDS:=		mke2fs parted sfdisk dosfstools mksh

PKG_SYSTEM_DEPENDS:=	mikrotik-rb532 lemote-yeelong pcengines-apu
PKG_DEPENDS_PCENGINES_APU:=	grub grub-tools
NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ADKINSTALL,adkinstall,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	$(INSTALL_DIR) $(IDIR_ADKINSTALL)/sbin
	$(INSTALL_BIN) ./src/adkinstall $(IDIR_ADKINSTALL)/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
