# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

# compiled with i486 toolchain, statically linked with uClibc
# cross-compile on amd64 does not work, so provide a binary package
PKG_NAME:=		grub-bin
PKG_VERSION:=		1.97.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		24961a39e63d8ec16d765aad3a301cda
PKG_DESCR:=		GRUB2 bootloader (binary package)
PKG_SECTION:=		base
PKG_SITES:=		http://openadk.org/distfiles/

PKG_TARGET_DEPENDS:=	x86 x86_64
CFLINE_GRUB_BIN:=	select BUSYBOX_FEATURE_STAT_FORMAT

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GRUB_BIN,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

PKGDFLT_GRUB_BIN=	y

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	${CP} ${WRKBUILD}/* ${IDIR_GRUB_BIN}/

include ${TOPDIR}/mk/pkg-bottom.mk
