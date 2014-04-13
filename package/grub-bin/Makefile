# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

# compiled with i486 toolchain, statically linked with uClibc
# cross-compiling is difficult, so provide a binary package
PKG_NAME:=		grub-bin
PKG_VERSION:=		1.98
PKG_RELEASE:=		2
PKG_MD5SUM:=		50dbe739776f904c318be05faf1d7ce5
PKG_DESCR:=		GRUB2 bootloader (binary package)
PKG_SECTION:=		boot
PKG_SITES:=		http://openadk.org/distfiles/
PKG_URL:=		http://www.gnu.org/software/grub

PKG_ARCH_DEPENDS:=	x86 x86_64

PKG_CFLINE_GRUB_BIN:=	select BUSYBOX_FEATURE_STAT_FORMAT@
PKG_CFLINE_GRUB_BIN+=	depends on !ADK_TARGET_ROOTFS_INITRAMFS_PIGGYBACK && !ADK_TARGET_ROOTFS_INITRAMFS

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GRUB_BIN,grub-bin,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	${CP} ${WRKBUILD}/* ${IDIR_GRUB_BIN}/

include ${TOPDIR}/mk/pkg-bottom.mk
