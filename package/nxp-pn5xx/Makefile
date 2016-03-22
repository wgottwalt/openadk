# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		nxp-pn5xx
PKG_VERSION:=		573e2ddb7cd15c34d3da0743318569f48b949ceb
PKG_GIT:=		hash
PKG_RELEASE:=		1
PKG_DESCR:=		driver for nfc pn5xx/pn71xx
PKG_SECTION:=		sys/drivers
PKG_URL:=		https://github.com/NXPNFCLinux/nxp-pn5xx
PKG_SITES:=		https://github.com/NXPNFCLinux/nxp-pn5xx.git

include $(ADK_TOPDIR)/mk/package.mk
include ${ADK_TOPDIR}/mk/kernel-ver.mk
include ${ADK_TOPDIR}/mk/kernel-vars.mk

$(eval $(call PKG_template,NXP_PN5XX,nxp-pn5xx,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	GCC_HONOUR_COPTS=0 LDFLAGS="" ${MAKE} -C ${LINUX_DIR} ${KERNEL_MAKE_OPTS} M="${WRKBUILD}" modules

do-install:
	${INSTALL_DIR} ${IDIR_NXP_PN5XX}/etc/modules.d/
	echo "pn5xx_i2c" > ${IDIR_NXP_PN5XX}/etc/modules.d/90-pn5xx
	${INSTALL_DIR} ${IDIR_NXP_PN5XX}/lib/modules/${KERNEL_VERSION}/
	$(INSTALL_DATA)	$(WRKBUILD)/pn5xx_i2c.ko \
		$(IDIR_NXP_PN5XX)/lib/modules/${KERNEL_VERSION}/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
