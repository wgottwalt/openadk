# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		sangam-atm
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		3843f3e670967fe81561770ac960c1cd
PKG_DESCR:=		DSL modem driver for TI AR7 boards
PKG_SECTION:=		kernel
PKG_DEPENDS:=		kmod-fw-loader kmod-atm
PKG_SITES:=		http://openadk.org/distfiles/

PKG_TARGET_DEPENDS:=	ag241

include ${TOPDIR}/mk/package.mk
include ${TOPDIR}/mk/kernel-vars.mk

$(eval $(call PKG_template,KMOD_SANGAM_ATM,kmod-sangam-atm,${KERNEL_VERSION}+${PKG_VERSION}-${ADK_TARGET}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-build:
	$(MAKE) ${KERNEL_MAKE_OPTS} LDFLAGS="" SUBDIRS="${WRKBUILD}" modules

do-install:
	${INSTALL_DIR} ${IDIR_KMOD_SANGAM_ATM}/etc/modules.d/
	echo "tiatm" > ${IDIR_KMOD_SANGAM_ATM}/etc/modules.d/70-sangam-atm
	${INSTALL_DIR} ${IDIR_KMOD_SANGAM_ATM}/lib/modules/${KERNEL_VERSION}/
	${INSTALL_DATA} ${WRKBUILD}/tiatm.ko \
		${IDIR_KMOD_SANGAM_ATM}/lib/modules/${KERNEL_VERSION}
	${INSTALL_DIR} ${IDIR_KMOD_SANGAM_ATM}/lib/firmware
ifeq (${ADK_PACKAGE_SANGAM_ATM_ANNEX_A},y)
	${INSTALL_DATA} ${WRKBUILD}/ar0700mp.bin \
		${IDIR_KMOD_SANGAM_ATM}/lib/firmware/ar0700xx.bin
endif
ifeq (${ADK_PACKAGE_SANGAM_ATM_ANNEX_B},y)
	${INSTALL_DATA} ${WRKBUILD}/ar0700db.bin \
		${IDIR_KMOD_SANGAM_ATM}/lib/firmware/ar0700xx.bin
endif

include ${TOPDIR}/mk/pkg-bottom.mk
