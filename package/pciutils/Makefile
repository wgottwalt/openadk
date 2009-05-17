# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pciutils
PKG_VERSION:=		3.0.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		d07da501bb11e6af40acd036536c2e9a
MASTER_SITES:=		http://www.kernel.org/pub/software/utils/pciutils/ \
			ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PCIUTILS,pciutils,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC="${TARGET_CC}" \
			CFLAGS="${TCFLAGS}" \
			IDSDIR="/usr/share" \
			HOST=${GNU_TARGET_NAME}
ALL_TARGET:=

do-install:
	${INSTALL_DIR} ${IDIR_PCIUTILS}/usr/{share,sbin}
	${INSTALL_BIN} ${WRKBUILD}/{lspci,setpci} ${IDIR_PCIUTILS}/usr/sbin/
	${INSTALL_DATA} ${WRKBUILD}/pci.ids ${IDIR_PCIUTILS}/usr/share/

include ${TOPDIR}/mk/pkg-bottom.mk
