# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pciutils
PKG_VERSION:=		3.1.7
PKG_RELEASE:=		2
PKG_MD5SUM:=		f3e349d22a3714b4272b171649ad5235
PKG_DESCR:=		PCI Utilities
PKG_SECTION:=		utils
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.kernel.org/pub/software/utils/pciutils/
PKG_SITES:=		http://www.kernel.org/pub/software/utils/pciutils/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PCIUTILS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

MAKE_FLAGS+=		CC="${TARGET_CC}" \
			CFLAGS="${TARGET_CFLAGS}" \
			CROSS_COMPILE="${TARGET_CROSS}" \
			IDSDIR="/usr/share" \
			HOST=${GNU_TARGET_NAME}
ALL_TARGET:=

do-install:
	${INSTALL_DIR} ${IDIR_PCIUTILS}/usr/{share,sbin}
	${INSTALL_BIN} ${WRKBUILD}/{lspci,setpci} ${IDIR_PCIUTILS}/usr/sbin/
	${INSTALL_DATA} ${WRKBUILD}/pci.ids ${IDIR_PCIUTILS}/usr/share/

include ${TOPDIR}/mk/pkg-bottom.mk
