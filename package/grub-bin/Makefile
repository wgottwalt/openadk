# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		grub-bin
PKG_VERSION:=		1.97
PKG_RELEASE:=		1
PKG_MD5SUM:=		db8dff73e119b51529d2a087c9d7d527
PKG_DESCR:=		GRUB bootloader
PKG_SECTION:=		sys
PKG_SITES:=		http://openadk.org/distfiles/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GRUB_BIN,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE=		manual

do-install:
	${CP} ${WRKBUILD}/* ${IDIR_GRUB_BIN}/

include ${TOPDIR}/mk/pkg-bottom.mk
