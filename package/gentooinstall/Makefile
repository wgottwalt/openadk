# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		gentooinstall
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		gentoo disk installer
PKG_SECTION:=		base/adk
PKG_DEPENDS:=		mke2fs parted sfdisk dosfstools mksh
PKG_DEPENDS+=		grub grub-tools
PKG_KDEPENDS:=		ext4-fs

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GENTOOINSTALL,gentooinstall,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

fwinstall-install:
	$(INSTALL_DIR) $(IDIR_GENTOOINSTALL)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/fwinstall $(IDIR_GENTOOINSTALL)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
